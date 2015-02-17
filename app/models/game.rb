class Game < ActiveRecord::Base
	has_many :boards 
	has_many :attacks, through: :boards
	has_many :ships, through: :boards
	
	def update_turn
		@boards = self.boards
		player1 = @boards.first
		player2 = @boards.last
		if (self.turn%2 == 0) && (player1.ships.any? {|ship| ship.point == player2.attacks.last.point})#compares all the player 1 ships to the last attack from player2
			self.turn = self.turn
		elsif (self.turn%2 != 0) && (player2.ships.any? {|ship| ship.point == player1.attacks.last.point})
			self.turn = self.turn
		else
			self.turn = self.turn + 1
		end
	end
=begin
	def game_over
		@boards = self.boards
		player1 = @game.boards.first
		player2 = @game.boards.last
		if (self.turn%2 == 0) && (player1.ships.any? {|ship| ship.point == player2.attacks.last.point})#compares all the player 1 ships to the last attack from player2
			p2score += 1
		elsif (self.turn%2 != 0) && (player2.ships.any? {|ship| ship.point == player1.attacks.last.point})
			p1score += 1
		else
			p1score = p1score
			p2score = p2score
		end
		if (p1score == 5) || (p2score == 5)
			return true
		else 
			return false
		end
	end
=end
end
