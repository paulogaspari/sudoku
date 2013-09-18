require_relative '../lib/grid'

describe Grid do

    # let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
    let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
    let(:grid) { Grid.new(puzzle) }
	    

	context "::::::::::::::::SETTING UP::::::::::::::::::" do



	  	it 'should have 81 elements in the array cells' do
	    	expect(grid.cells.count).to eq 81
	    end

	  	it 'should create an array with 81 objects' do
	  		expect(grid.cells.count).to eq 81
	  	end

	  	it 'value atributted to each one of those objects is not nil' do
	  		expect(grid.cells.any?{|e| e.value.nil? }).to be_false
	  	end

	  
	  	it'should print puzzle to solve' do
	  		expect(grid.print_puzzle(grid.sudoku)).to be_true
	  	end
	end





	context ':::::::::: SOLVING ::::::::::::::' do


		xit ' has the solve method working' do
			
			expect(grid.solve).to
			gird.solve
		end

		it 'has the figure out method working'  do
			expect(grid).to receive(:line_neighbours).with(40)
			expect(grid).to receive(:column_neighbours).with(40)
			expect(grid).to receive(:box_neighbours).with(40)
			expect(grid).to receive(:number_to_cell).with(40)
			grid.figure_out_cell_value(40)			
		end


	  # 	xit 'should update the value 0 of the first cell to 6' do
			# grid.execute_solving
	  # 		expect(grid.cells.first.value).to eq(6)
	  # 		expect(grid.print_puzzle(grid.object_values_to_array)).to be_true
	  # 	end



	  	it 'should get line_neighbours' do
	  		expect(grid.line_neighbours(3)).to eq [0, 1, 5, 0, 0, 3, 0, 0, 2] 
	  	end

	  	it 'should get column_neighbours' do
	  		expect(grid.column_neighbours(3)).to eq [0, 1, 0, 0, 0, 9, 0, 0, 2] 
	  	end

	  	it 'should get box_neighbours' do
	  		expect(grid.box_neighbours(3)).to eq [0, 1, 0, 0, 0, 6, 3, 0, 8]
	  	end


	  	it 'should have one missing number only for the first cell' do
	  		grid.box_neighbours(0)
	  		grid.line_neighbours(0)
	  		grid.column_neighbours(0)
	  		expect(grid.missing_number).to eq [6]
	  	end

	  	it 'puts THE PROCESSED SOLLUTION' do
	  		grid.solve
	  		expect(grid.print_puzzle(grid.program_solution)).to be_true
	  	end




	  	it 'puts the solution onto the screen' do
	  		expect(grid.print_puzzle(grid.cheat_sollution)).to be_true
	  	end
	 	

	end




end

