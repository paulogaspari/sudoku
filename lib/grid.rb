require_relative 'cell'

class Grid


	attr_accessor :cells, :sudoku

	def initialize(puzzle)
		@cells = puzzle_to_cells(puzzle)
		find_neighbours_of_cell
	end


	def puzzle_to_cells(puzzle)
		@sudoku = puzzle.each_char.to_a.map {|cell| cell.to_i}
		@sudoku.map {|value| Cell.new(value)}
	end


	def solve
		until solved? do
			@cells.each_with_index do |element, index|
				figure_out_cell_value(index) if element.value == 0
			end
		end
	end


	def figure_out_cell_value(index)
		line_neighbours(index)
		column_neighbours(index)
		box_neighbours(index)
		number_to_cell(index)
	end


	def number_to_cell(index)
		(@cells[index].value = missing_number.first) if missing_number.count == 1
	end

	def missing_number	
		Array(1..9) - @line - @column - @box
	end


	def solved?
		@cells.all?{|e| e.value != 0 }
	end


################################################################
#                    CALCULATING NEIGHBOURS                    #
################################################################

	def find_neighbours_of_cell
		box_neighbours_input
	end


	def line_neighbours(index)
		row_index = index/9
		start = row_index * 9
		end_index = start+9
		@line = (start...end_index).to_a.map{|i| @cells[i].value}
	end	



	def column_neighbours(index)
		c = index%9
		@column = []
		[c,c+9,c+18,c+27,c+36,c+45,c+54,c+63,c+72].each{|i| @column << @cells[i].value}
		return @column
	end


	def box_neighbours_input
		@cells.each_slice(9).to_a.each_slice(3).to_a.map{|rows| rows.transpose}.flatten.each_slice(9).each_with_index {|row, row_index| row.map {|cell| cell.box_neighbours = row}}
	end


	def box_neighbours (index)
		@box = @cells[index].box_neighbours.map { |element| element.value }
	end


################################################################
#                       PRINTING SUDOKUs                       #
################################################################

	def program_solution
		@cells.map {|cells| cells.value}
	end

	def sudoku_board
		sudoku_b = @cells.map {|value| cell.value}
	end

	def cheat_sollution
		'615493872348127956279568431496832517521746389783915264952681743864379125137254698'.each_char.to_a.map {|cell| cell.to_i}
	end

	def print_puzzle(array)
		sudoku_divided = array.each_slice(9).to_a
		puts "\n" + " -----------------------------------"
		sudoku_divided.each do |element| 
			element.each{|element2| (element2 != 0) ? print( "| #{element2} ") : print('|   ') }
			puts '|' + "\n ---+---+---+---+---+---+---+---+---"
		end
	end


	# def object_values_to_array
	# 	@sollution_array = []
	# 	@cells.each do |cell|
	# 		@sollution_array << cell.value
	# 	end
	# 	return @sollution_array
	# end

	


end


