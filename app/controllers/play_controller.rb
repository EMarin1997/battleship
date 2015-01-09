class PlayController < ApplicationController
  def index
  	@game = Game.last
  	@boards = @game.boards.count
  	puts @game.id
  	puts @boards
  	puts '***********'

  end
end
