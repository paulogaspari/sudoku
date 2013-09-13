require_relative '../lib/grid'

describe Grid do

    let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
    let(:grid) { Grid.new(puzzle) }
	    

	context "::::::::::::::::SETTING UP::::::::::::::::::" do

	  	it 'should be passed a string that contains 81 characters' do
	    	expect(grid.puzzle.chars.count).to eq 81
	    end


	  	it 'should have 81 elements in the array sudoku' do
	    	grid.puzzle_to_cells
	    	expect(grid.sudoku.count).to eq 81
	    end

	  	it 'should create an array with 81 objects' do
	  		grid.puzzle_to_cells
	  		expect(grid.cells.count).to eq 81
	  	end

	  	it '@value atributted to each one of those objects cannot be nil' do
	  		grid.puzzle_to_cells
	  		expect(grid.cells[43].value).to_not be_nil
	  		expect(grid.cells.each{|x| x != nil}).to_not be_nil
	  	end

	  
	  	it'should print puzzle to solve' do
	  		expect(grid.print_puzzle(grid.sudoku)).to be_true
	  	end
	end





	context ':::::::::: SOLVING ::::::::::::::' do


		xit 'should call method to figure out cell value if first cell value is 0' do
			grid.puzzle_to_cells
			grid.execute_solving
			# expect(grid.cells.first.value).to eq 0
			expect(grid.execute_solving).to receive(6).with(0)
			# expect to execute figure_out_cell_value with index 0
		end


	  	it 'should update the value 0 of the first cell to 6' do
	  		grid.puzzle_to_cells
			grid.execute_solving
	  		expect(grid.cells.first.value).to eq(6)
	  		expect(grid.print_puzzle(grid.object_values_to_array)).to be_true
	  	end





	  	it 'should get neighbours_indexes_in_line' do
	  		expect(grid.neighbours_indexes_in_line(40)).to eq [36, 37, 38, 39, 40, 41, 42, 43, 44] 
	  	end

	  	it 'should get neighbours_indexes_in_column' do
	  		expect(grid.neighbours_indexes_in_column(40)).to eq [4, 13, 22, 31, 40, 49, 58, 67, 76] 
	  	end

	  	it 'should get neighbours_indexes_in_box' do
	  		grid.puzzle_to_cells
	  		grid.neighbours_indexes_in_box(40)
	  		expect(grid.neighbours_in_box).to eq [30, 31, 32, 39, 40, 41, 58, 49, 51] 
	  	end





	  	it 'puts the solution onto the screen' do
	  		expect(grid.print_puzzle(grid.cheat_sollution)).to be_true
	  	end
	 	
	 	# expect(subject).to receive(:some_method).with do |arg|
	 	# arg == 1
  		# end

  		# subject.some_method(1)
		# end
	end









  context ":::::::::::::::::::solving sudoku::::::::::::::::::" do



  	it 'test neighbours array' do

  	end



  	xit'should print puzzle sollution' do
  		grid.solve
  		expect(grid.print_puzzle(grid.object_values_to_array)).to be_true
  	end



    
    xit "can solve the puzzle" do
      expect(grid.solved?).to be_false
      grid.solve
      expect(grid.solved?).to be_true
      expect(grid.to_s).to eq('615493872348127956279568431496832517521746389783915264952681743864379125137254698')
    end
  
  end

end



# real array:
# [0, 1, 5, 0, 0, 3, 0, 0, 2, 0, 0, 0, 1, 0, 0, 9, 0, 6, 2, 7, 0, 0, 6, 8, 4, 3, 0, 4, 9, 0, 0, 0, 2, 0, 1, 7, 5, 0, 1, 0, 4, 0, 3, 8, 0, 0, 0, 3, 9, 0, 5, 0, 0, 0, 9, 0, 0, 0, 8, 1, 0, 4, 0, 8, 6, 0, 0, 7, 0, 0, 2, 5, 0, 3, 7, 2, 0, 4, 6, 0, 0] 

