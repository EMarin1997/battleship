class Attack < ActiveRecord::Base
	belongs_to :game
	belongs_to :board

end
