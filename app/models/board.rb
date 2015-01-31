class Board < ActiveRecord::Base
	belongs_to :game
	has_many :attacks
	has_many :ships
	accepts_nested_attributes_for :ships
	accepts_nested_attributes_for :attacks

	def test(a)
		@game = Game.find(game_id) #Looks for the current game
		player1 = @game.boards.first # This will be used in a comparison
		player2 = @game.boards.last#   later to decide who is the enemy
		matching = self.attacks.select do |attack| # checks to see if any 'attack' is equal to point 'a'
			a == attack.point
		end
		if self.id == player1.id
			target = player2.ships.select do |ship|
				a == ship.point
			end
		else
			target = player1.ships.select do |ship|
				a == ship.point
			end
		end

		if matching.any? && target.any?
			return 'hit'
		elsif (matching.count == 1) && (target.count == 0)
			return 'miss'
		else
			return 'water'
		end
	end
	
	def status(y)
		@game = Game.find(game_id) #Looks for the current game
		player1 = @game.boards.first # This will be used in a comparison
		player2 = @game.boards.last#   later to decide who is the enemy
		mine = self.ships.select do |ship|
			y == ship.point
		end
		if self.id == player1.id
			damage = player2.attacks.select do |attack|
				y == attack.point
			end
		else
			damage = player1.attacks.select do |attack|
				y == attack.point
			end
		end

		if mine.any? && damage.any?
			return 'hit'
		elsif mine.any? && (damage.count == 0)
			return 'ship'
		elsif (mine.count == 0) && damage.any?
			return 'miss'
		else
			return 'water'
		end

	end
end
