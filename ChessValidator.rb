require 'pry'

class Game

	def initialize
		@board = BoardTable.new
		@WP = Pawn.new
		actions
	end

	def actions
		set_positions
		@board.show_board
		movement
		@board.show_board

		who_is_here?("a6")
	end

	def set_positions
		@WP.set_position(@board.board)
	end

	def movement
		@WP.delete_position(@board.board)
		@WP.moves
		@WP.set_position(@board.board)
	end

	def who_is_here?(position)
		#binding.pry
		here = @board.coodinates_translator(position)
		here_is = @board.board[here[0]][here[1]]
		puts here_is

	end

end

class BoardTable
	attr_accessor :board

	def initialize

		@columns = ["a", "b", "c", "d", "e", "f", "g", "h"]
		@rows = [8, 7, 6, 5, 4, 3, 2, 1]

		@board = [[00, 00, 00, 00, 00, 00, 00, 00],
				 [00, 00, 00, 00, 00, 00, 00, 00],
				 [00, 00, 00, 00, 00, 00, 00, 00],
				 [00, 00, 00, 00, 00, 00, 00, 00],
				 [00, 00, 00, 00, 00, 00, 00, 00],
				 [00, 00, 00, 00, 00, 00, 00, 00],
				 [00, 00, 00, 00, 00, 00, 00, 00],
				 [00, 00, 00, 00, 00, 00, 00, 00]]
	end

	def show_board
		system "clear"
		@board.each_with_index {|item, index|
  			print "#{@board[index]}\n"
			}
	end

	def coodinates_translator(position)

		translated_row=0
		translated_column=0


		@rows.each_with_index {|item, index|
			
  			if @rows[index] == position[1].to_i
  				translated_row = index
  			end
			}

		@columns.each_with_index {|item, index|
  			if @columns[index] == position[0]
  				translated_column = index
  			end
			}


		return [translated_row, translated_column]
	end

end

class Pieces

	def initialize
		@type
		@color
		@position
	end

	def set_position(board)
		board[@position[0]][@position[1]] = @color+@type
	end

	def delete_position(board)
		board[@position[0]][@position[1]]=00
	end

end

class Pawn < Pieces

	def initialize
		@type="P"
		@color="W"  #W = white ---- B = black
		@position = [1, 0]
	end

	def moves
		@position[0] = @position[0]+1
	end

end

game = Game.new