class AttacksController < ApplicationController
	
	def create
		@board = Board.find(params[:board_id])
		@attack = @board.attacks.create(attack_params)
		@game = Game.find(@board.game_id)
		@game.update_turn
		@game.save
		redirect_to game_board_path(@board.game_id, @board.id)
	end

	private
		def attack_params
			params.require(:attack).permit(:point)
		end

end
