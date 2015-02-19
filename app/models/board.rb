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

	def my_turn
		@game = Game.find(game_id) #Looks for the current game
		player1 = @game.boards.first # This will be used in a comparison
		player2 = @game.boards.last#   later to decide who is the enemy
		if (@game.turn%2 == 0) && (self.id == player2.id)#if the turn is even its player 2 turn
			return true
		elsif (@game.turn%2 != 0) && (self.id == player1.id)#if turn is odd its player 1 turn
			return true
		else 
			return false #else it is not your turn
		end
	end

	def win
		testing = self.attacks.select do |attack|
			attack.hit
		end
		if (testing.any?) && (testing.count >= 5)
			return true
		else 
			return false
		end
	end

	def lose
		@game = Game.find(game_id) #Looks for the current game
		player1 = @game.boards.first # This will be used in a comparison
		player2 = @game.boards.last#   later to decide who is the enemy
		(self.id == player1.id)? enemy = player2 : enemy = player1
		if enemy.win
			return true
		else 
			return false
		end
	end
end
