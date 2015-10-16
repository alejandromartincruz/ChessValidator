require 'pry'
require './classes/boardtable'
require './classes/pieces'

class Main

	def initialize
		@board = BoardTable.new
		#@WP = Pawn.new
		actions
	end

	def actions
		set_positions
		@board.show_board
		#movement("a7")
		#@board.show_board
	end

	def set_positions
		@board.board.each_with_index {|item, index|
			@board.board[index].each_with_index { |innerItem, innerIndex|
			if @board.board[index][innerIndex] != 0
  				innerItem
  			end
  				}
			}
		
	end

	def movement(position)
		here_is = who_is_here?(position)
		#@WP.delete_position(@board.board)
		#@WP.moves
		#@WP.set_position(@board.board)
	end

	def who_is_here?(position)
		#binding.pry
		here = @board.coodinates_translator(position)
		here_is = @board.board[here[0]][here[1]]
		return @here_is
	end


end











game = Main.new