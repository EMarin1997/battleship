class Board < ActiveRecord::Base
	belongs_to :game
	has_many :attacks
	has_many :ships
	accepts_nested_attributes_for :ships
	accepts_nested_attributes_for :attacks
	

	def random
		@game = Game.find(game_id)
	end
=begin
	def test(a)
		matching = self.attacks.select do |attack|
			a == attack.point
		end
		return 'water' if matching.count == 0 end
		if matching.any? self.attacks.each do |attack|
			self.enemy.each do |target|
				if target == attack
					return 'hit'
				else
					return 'miss'
				end
			end
		end
	end
=end
	def place(y)
		mine = self.ships.select do |ship|
			y == ship.point
		end
		mine.count == 0? (return 'water'):(return 'ship')
	end
end
