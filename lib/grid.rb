require_relative 'cell'

class Grid

	attr_accessor :cells, :sudoku, :puzzle

	def initialize(puzzle)
		@puzzle= puzzle 
		@cells = []
		puzzle_to_cells
	end


	def puzzle_to_cells
		@sudoku = @puzzle.each_char.to_a.map {|cell| cell.to_i} 
		@cells = @sudoku.map {|value| Cell.new(value)}
	end


	def solve
		# while !solved? do
		# 	execute_solving
		# end
	end


	def execute_solving
		@cells.each_with_index do |element, index|
			figure_out_cell_value(index) if element.value == 0 
		end
	end


	def figure_out_cell_value(index)

		neighbours_arrays(index)
		puts "LINE: #{@line_elements.inspect}"
		puts "BOX: #{@box_elements.inspect}"
		puts "COLUMN: #{@column_elements.inspect}"
		puts "#{index}"
		number_to_cell(index)
	end


	def neighbours_arrays(index)
		@column_elements = []
		@box_elements = []

		# Element position:
		row_index = index/9
		column_index = index - (9*row_index.to_i)

		# Getting neighbours indexes into an array of values
		

		@line_elements = cell_values(neighbours_in_line(index, column_index))

		neighbours_in_column(column_index).each{|i| @column_elements << @cells[i].value}		
		neighbours_in_box(column_index, row_index).each{|i| @box_elements << @cells[i].value}
	end

	def row_and_column
	end

	def cell_values(index_array)
		index_array.map{|i| @cells[i].value}
	end

	def neighbour_values_in_line(index)
		row_index = index/9
		column_index = index - (9*row_index.to_i)
		cell_values(neighbours_in_line(index, column_index))
	end

	def number_to_cell(index)
		missing_number = Array(0..9) - @line_elements - @column_elements - @box_elements
		# print missing_number
		(@cells[index].value = missing_number.first) if missing_number.count == 1
	end


	def neighbours_in_line(row_index,index)
		start = row_index * 9
		end_index = start+9
		(start..end_index).to_a
	end	


	# def old_neighbours_in_line(i, p)
	# 	puts [i-p,i+(1-p),i+(2-p),i+(3-p),i+(4-p),i+(5-p),i+(6-p),i+(7-p),i+(8-p)]

	# end	

	def neighbours_in_column(c)
		[c,c+9,c+18,c+27,c+36,c+45,c+54,c+63,c+72]
	end

	def neighbours_in_box (r,c)
		i = determine_box_index(r,c)
		raise "i:#{i},r:#{r},c:#{c}" if i.nil?
		[0+(3*i),1+(3*i),2+(3*i),9+(3*i),10+(3*i),11+(3*i),18+(3*i),19+(3*i),20+(3*i)]
	end

	def determine_box_index(r,c)
		boxes = [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]
		box = []

		box << 0 if (0 <= r) && (r <= 2)
		box << 1 if (3 <= r) && (r <= 5)
		box << 2 if (6 <= r) && (r <= 8)
		
		box << 0 if (0 <= c) && (c <= 2)
		box << 1 if (3 <= c) && (c <= 5)
		box << 2 if (6 <= c) && (c <= 8)	
		
		return boxes.index(box) #=>5
	end		


	def solved?
		@cells.count == 81 && @cells.index(0) == 0
	end


	def print_puzzle(array)
		sudoku_divided = array.each_slice(9).to_a
		puts "\n" + " -----------------------------------"
		sudoku_divided.each do |element| 
			element.each{|element2| (element2 != 0) ? print( "| #{element2} ") : print('|   ') }
			puts '|' + "\n ---+---+---+---+---+---+---+---+---"
		end
	end

	def object_values_to_array
		@sollution_array = []
		# puts "CELLS ARRAY:  " +  @cells.inspect
		@cells.each do |cell|
			@sollution_array << cell.value

		end
		puts "SOLUTION ARRAY:  " + @sollution_array.inspect
		return @sollution_array
	end

	def cheat_sollution
		'615493872348127956279568431496832517521746389783915264952681743864379125137254698'.each_char.to_a.map {|cell| cell.to_i}
	end


end



























# STARTED REPAIRING THE INFINIT LOOP, ADDING CELL OBJECTS AGAIN



# require_relative 'cell'

# class Grid

# 	attr_accessor :cells, :sudoku

# 	def initialize(puzzle)
# 		@puzzle= puzzle # [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]
# 		@cells = []
# 		puzzle_to_cells
# 	end


# 	def puzzle_to_cells
# 		@sudoku = @puzzle.each_char.to_a.map {|cell| cell.to_i}
# 		@cells = @sudoku.each {|value| Cell.new(value)}
# 	end


# 	def print_puzzle(array)
# 		sudoku_divided = array.each_slice(9).to_a
# 		puts "\n" + " -----------------------------------"
# 		sudoku_divided.each do |element| 
# 			element.each{|element2| (element2 != 0) ? print( "| #{element2} ") : print('|   ') }
# 			puts '|' + "\n ---+---+---+---+---+---+---+---+---"
# 		end
# 	end


# 	def solve
# 		while !solved? do
# 			execute_solving
# 		end
# 	end

# 	def execute_solving
# 		@cells.each_with_index do |element, index|
# 			if element > 0 
# 				@cells << element
# 			else
# 				figure_out_cell_value(element, index)
# 			end
# 		end
# 	end

# 	def figure_out_cell_value(element, index)

# 		neighbours_arrays(element,index)
# 		# puts "LINE: #{@line_elements.inspect}"
# 		# puts "BOX: #{@box_elements.inspect}"
# 		# puts "COLUMN: #{@column_elements.inspect}"

# 		number_to_cell
# 	end


# 	def neighbours_arrays(element, index)
		
# 		@line_elements = []
# 		@column_elements = []
# 		@box_elements = []

# 		# Element position:
# 		row_index = index/9
# 		column_index = index - (9*row_index.to_i)

# 		# Getting neighbours indexes into an array of values
# 		neighbours_in_line(index, column_index).each{|i| @line_elements << @sudoku[i]}
# 		neighbours_in_column(column_index).each{|i| @column_elements << @sudoku[i]}		
# 		neighbours_in_box(column_index, row_index).each{|i| @box_elements << @sudoku[i]}
# 	end


# 	def number_to_cell
# 		missing_number = Array(0..9) - @line_elements - @column_elements - @box_elements
# 		# print missing_number

# 			if missing_number.count == 1
# 				@cells << missing_number.first
# 			else
# 				@cells << 0
# 			end
# 		end


# 		def neighbours_in_line(i, p)
# 			[i-p,i+(1-p),i+(2-p),i+(3-p),i+(4-p),i+(5-p),i+(6-p),i+(7-p),i+(8-p)]
# 		end	

# 		def neighbours_in_column(c)
# 			[c,c+9,c+18,c+27,c+36,c+45,c+54,c+63,c+72]
# 		end

# 		def neighbours_in_box (r,c)
# 			i = determine_box_index(r,c)
# 			raise "i:#{i},r:#{r},c:#{c}" if i.nil?
# 			[0+(3*i),1+(3*i),2+(3*i),9+(3*i),10+(3*i),11+(3*i),18+(3*i),19+(3*i),20+(3*i)]
# 		end

# 		def determine_box_index(r,c)
# 			boxes = [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]
# 			box = []

# 			box << 0 if (0 <= r) && (r <= 2)
# 			box << 1 if (3 <= r) && (r <= 5)
# 			box << 2 if (6 <= r) && (r <= 8)
			
# 			box << 0 if (0 <= c) && (c <= 2)
# 			box << 1 if (3 <= c) && (c <= 5)
# 			box << 2 if (6 <= c) && (c <= 8)	
			
# 			return boxes.index(box) #=>5
# 		end		


# 	def solved?
# 		@cells.count == 81 && @cells.index(0) == 0
# 	end

# end











































# require_relative 'cell'

# class Grid

# 	attr_accessor :cells, :sudoku

# 	def initialize(puzzle)
# 		@puzzle= puzzle # [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]
# 		@cells = []
# 		puzzle_to_array
# 	end


# 	def puzzle_to_array	
# 		@sudoku = @puzzle.each_char.to_a.map {|cell| cell.to_i}
# 	end


# 	def print_puzzle(array)
# 		sudoku_divided = array.each_slice(9).to_a
# 		puts "\n" + " -----------------------------------"
# 		sudoku_divided.each do |element| 
# 			element.each{|element2| (element2 != 0) ? print( "| #{element2} ") : print('|   ') }
# 			puts '|' + "\n ---+---+---+---+---+---+---+---+---"
# 		end
# 	end


# 	def solve
# 		@sudoku.each_with_index do |element, index|
# 			@cells << Cell.new(element) if element > 0
# 			figure_out_cell_value(element, index)
# 		end
# 	end


# 	def figure_out_cell_value(element, index)
		
# 		# Element position:
# 		row_index = index/9
# 		column_index = index - (9*row.to_i)

# 		# Getting neighbours indexes into an array of values
# 		line_elements = []
# 		neighbours_in_line(index, column_index).each{|i| line_elements << a[i]}
		
# 		column_elements = []
# 		neighbours_in_column(column_index).each{|i| column_elments << a[i]}
		
# 		box_elements = []
# 		neighbours_in_box(index, row_index).each{|i| box_elments << a[i]}

# 		# Knowing which elements are missing
# 		missing_number = [1..9] - line_elments - column_elements - box_elements

# 		# check if its only one value
# 			if missing_number.count == 1
# 				@cells << Cell.new(missing_number) 
# 			end

# 		end


# 		def neighbours_in_line(i, p)
# 			[i-p,i+(1-p),i+(2-p),i+(3-p),i+(4-p),i+(5-p),i+(6-p),i+(7-p),i+(8-p)]
# 		end	

# 		def neighbours_in_column(c)
# 			[c,c+9,c+18,c+27,c+36,c+45,c+54,c+63,c+72]
# 		end

# 		def neigbours_in_box (r,c)
# 			i = determine_box_index(r,c)
# 			[0+(3*i),1+(3*i),2+(3*i),9+(3*i),10+(3*i),11+(3*i),18+(3*i),19+(3*i),20+(3*i)]
# 		end

# 		def determine_box_index(r,c)
# 			boxes = [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]
# 			box = []

# 			box << 0 if (0 <= r) && (r <= 2)
# 			box << 1 if (3 <= r) && (r <= 5)
# 			box << 2 if (6 <= r) && (r <= 8)
			
# 			box << 0 if (0 <= c) && (c <= 2)
# 			box << 1 if (3 <= c) && (c <= 5)
# 			box << 2 if (6 <= c) && (c <= 8)	
			
# 			return boxes.index(box) #=>5
# 		end		






# 	def solved?
		
# 	end

# end