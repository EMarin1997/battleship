class GamesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @game = Game.new
    @game.turn = 1
    @game.save
    puts '********************'
    puts @game
    redirect_to new_game_board_path(@game.id)
  end

  def show
    @game = Game.find(params[:id])
    @size = 10
  end

end
