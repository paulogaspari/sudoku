require_relative '../lib/grid'

describe Grid do

    let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
    let(:grid) { Grid.new(puzzle) }
	    

	context "::::::::::::::::SETTING UP::::::::::::::::::" do



	  	it 'should have 81 elements in the array cells' do
	    	expect(grid.cells.count).to eq 81
	    end

	  	it 'should create an array with 81 objects' do
	  		expect(grid.cells.count).to eq 81
	  	end

	  	it '@value atributted to each one of those objects cannot be nil' do
	  		expect(grid.cells[1].value).to_not be_nil
	  		# expect(grid.cells.each{|x| x != nil}).to_not be_nil
	  	end

	  
	  	it'should print puzzle to solve' do
	  		expect(grid.print_puzzle(grid.sudoku)).to be_true
	  	end
	end





	context ':::::::::: SOLVING ::::::::::::::' do


		it 'has the figure out method working'  do
			grid.figure_out_cell_value(40)
			expect(grid.number_to_cell(40)).to receive(40)
			# expect to execute figure_out_cell_value with index 0
		end


	  # 	xit 'should update the value 0 of the first cell to 6' do
			# grid.execute_solving
	  # 		expect(grid.cells.first.value).to eq(6)
	  # 		expect(grid.print_puzzle(grid.object_values_to_array)).to be_true
	  # 	end



	  	it 'should get line_neighbours' do
	  		expect(grid.line_neighbours(40)).to eq [5, 0, 1, 0, 4, 0, 3, 8, 0] 
	  	end

	  	it 'should get column_neighbours' do
	  		expect(grid.column_neighbours(40)).to eq [0, 0, 6, 0, 4, 0, 8, 7, 0] 
	  	end

	  	it 'should get box_neighbours' do
	  		expect(grid.box_neighbours(0)).to eq [0, 0, 2, 1, 0, 7, 5, 0, 0]
	  	end



	  	it 'puts the result of the program onto the screen' do
	  		expect(grid.print_puzzle(grid.program_solution)).to be_true
	  	end

	  	it 'puts the solution onto the screen' do
	  		expect(grid.print_puzzle(grid.cheat_sollution)).to be_true
	  	end
	 	

	end




end

