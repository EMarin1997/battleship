class Game < ActiveRecord::Base
	has_many :boards 
	has_many :attacks, through: :boards
	has_many :ships, through: :boards
	
	def test(a)
		matching = self.attacks.select do |attack|
			a == attack.point
		end
		return 'water' if matching.count == 0
		if matching.any? { |attack| attack.point == self.enemy}
			return 'hit'
		else
			return 'miss'
		end
	end

	def place(y)
		mine = self.ships.select do |ship|
			y == ship.point
		end
		mine.count == 0? (return 'water'):(return 'ship')
	end

end
