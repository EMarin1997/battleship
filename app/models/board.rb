class Board < ActiveRecord::Base
	has_many :attacks
	before_create :random

	def random
		point = ["A1","A2","A3","A4","A5","A6","B1","B2","B3","B4","B5","B6","C1","C2","C3","C4","C5","C6","D1","D2","D3","D4","D5","D6","E1","E2","E3","E4","E5","E6","F1","F2","F3","F4","F5","F6"]
		self.enemy = point[rand(point.length)]
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
