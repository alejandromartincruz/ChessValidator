require 'pry'
require './classes/boardtable'
require './classes/pieces'

class Main

	def initialize
		@board = BoardTable.new
		actions
	end

	def actions
		set_positions
		@board.show_board
		#movement("a7")
		@board.show_board
	end

	def set_positions
		@board.board.each_with_index {|item, index|
			@board.board[index].each_with_index { |innerItem, innerIndex|
			if @board.board[index][innerIndex] != 0

  				creating_pieces(innerItem, index, innerIndex)
  			end
  				}
			}
		
	end

	def movement(position)
		object_pos = @board.coodinates_translator(position)
		puts @board.board[object_pos[0]][object_pos[1]].moves
		
		#@board.board[here_is[0]][here_is[1]].delete_position(@board.board)
		#@board.board[here_is[0]][here_is[1]].moves
		#@board.board[here_is[0]][here_is[1]].set_position(@board.board)
	end

	def who_is_here?(position)
		
		here = @board.coodinates_translator(position)
		here_is = @board.board[here[0]][here[1]].type
		return @here_is
	end

	def creating_pieces(piece, index, innerIndex)
		mapped_pieces = {W: {P: Pawn, K: "King"},
						 B: {P: Pawn, K: "King"}}
		
		@board.board[index][innerIndex] = mapped_pieces[piece[0].to_sym][piece[1].to_sym].new([index, innerIndex])
	end

end


game = Main.new