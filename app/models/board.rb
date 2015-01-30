class Board < ActiveRecord::Base
	belongs_to :game
	has_many :attacks
	has_many :ships
	accepts_nested_attributes_for :ships
	accepts_nested_attributes_for :attacks
	

	def random
		@game = Game.find(game_id)
	end

	def test(a)
		if (self.attacks.any? {|attack| attack == a}) && (self.enemy.any?{|enemy| enemy == a}) 
			return 'hit'
		elsif (self.attacks.any? {|attack| attack == a}) && (self.enemy.any?{|enemy| enemy != a})
			return 'miss'
		else
			return 'water'
		end
	end
	
	def place(y)
		mine = self.ships.select do |ship|
			y == ship.point
		end
		mine.count == 0? (return 'water'):(return 'ship')
	end
end
