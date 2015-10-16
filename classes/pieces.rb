class Pieces
	attr_accessor :type, :color, :position

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

	def initialize(pos)
		@type="P"
		@color="W"  #W = white ---- B = black
		@position = [pos[0], pos[1]]
	end

	def moves

		@position[0] = @position[0]+1

	end

end