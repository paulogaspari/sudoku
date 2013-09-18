class Cell

	attr_accessor :value, :box_neighbours

	def initialize(value)
		@value = value
		@box_neighbours = []
		@line_neighbours = []
		@column_neighbours = []
	end




end

