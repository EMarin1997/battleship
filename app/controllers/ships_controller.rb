class ShipsController < ApplicationController
	
	def create
		@board = Board.find(params[:board_id])
		@ship = @board.ships.create(ship_params)
		redirect_to board_path(@board)
	end

	private
		def ship_params
			params.require(:ship).permit(:point)
		end

end
