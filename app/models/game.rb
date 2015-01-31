class Game < ActiveRecord::Base
	has_many :boards 
	has_many :attacks, through: :boards
	has_many :ships, through: :boards
	
end
