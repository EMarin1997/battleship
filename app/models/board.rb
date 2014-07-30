class Board < ActiveRecord::Base
	has_many :attacks
	has_many :ships
	accepts_nested_attributes_for :ships
	accepts_nested_attributes_for :attacks
	before_create :random

	def random
		@size = 10
		self.enemy = "#{("A".ord+rand(@size)).chr}#{rand(@size)}"
	end

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
