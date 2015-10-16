class BoardTable
	attr_accessor :board

	def initialize

		@columns = ["a", "b", "c", "d", "e", "f", "g", "h"]
		@rows = [8, 7, 6, 5, 4, 3, 2, 1]

		@board = [[00, 00, 00, 00, 00, 00, 00, 00],
				 ["WP", 00, 00, 00, 00, 00, 00, 00],
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