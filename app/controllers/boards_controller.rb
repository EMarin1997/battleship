class BoardsController < ApplicationController
	def new
	end

	def create
		@board = Board.new(board_params)

		@board.save
		redirect_to @board
	end

	def update
		@board = Board.find(params[:id])
		@board.attack

		redirect_to @board
	end

	def index
		@boards = Board.all
	end

	def show
		@board = Board.find(params[:id])
		@size = 10
	end

	def destroy
	end

	private
	def board_params
		params.require(:board).permit(:ship, :attack)
	end

end
