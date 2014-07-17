class Board < ActiveRecord::Base
	has_many :attacks
	before_create :random

	def random
		@size = 10
		self.enemy = "#{("A".ord+rand(@size)).chr}#{rand(@size)}"
	end

	def test(x)
		if (self.attack == self.enemy) && (self.enemy == x)
			'hit'
		elsif (self.attack != self.enemy) && (self.attack == x)
			'miss'
		else
			'water'
		end	
	end

	def place(y)
		if self.ship == y
			'ship'
		else
			'water'
		end
	end
end
