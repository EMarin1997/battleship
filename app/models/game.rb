class Game < ActiveRecord::Base
	has_many :boards 
	has_many :attacks, through: :boards
	has_many :ships, through: :boards
	before_create :defualt_turn

	def default_turn
		self.turn = 1
	end

	
end
