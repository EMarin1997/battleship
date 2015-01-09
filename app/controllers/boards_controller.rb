class BoardsController < ApplicationController
	def new
	end

	def create
		@board = Board.new
		@board.game_id = params["game_id"]

		@board.save
		puts '**********'
		puts @board.id
		puts @board.game_id
		redirect_to game_board_path(@board.game_id, @board.id)
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
		@game = Game.find(params[:game_id])
		@board = Board.find(params[:id])
		@size = 10
	end

	def destroy
	end

end
