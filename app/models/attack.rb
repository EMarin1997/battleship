class Attack < ActiveRecord::Base
	belongs_to :game
	belongs_to :board

	def hit
		@board = Board.find(board_id)
		@game = Game.find(@board.game_id)
		player1 = @game.boards.first
		player2 = @game.boards.last
		(@board.id == player1.id)? enemy = player2 : enemy = player1
		matching = enemy.ships.select do |ship| 
			ship.point == self.point
		end
		matching.any?
	end

end
