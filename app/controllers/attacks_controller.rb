class AttacksController < ApplicationController
	
	def create
		@board = Board.find(params[:board_id])
		@attack = @board.attacks.create(attack_params)
		redirect_to board_path(@board)
	end

	private
		def attack_params
			params.require(:attack).permit(:point)
		end

end
