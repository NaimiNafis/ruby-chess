require_relative 'pawn'
require_relative 'rook'

class Board

    attr_reader :grid 
    
    def initialize
        @grid = [
            ["X", "X", nil, "X"],
            ["X", "X", nil, "X"],
            ["X", "X", nil, "X"],
            ["X", "X", nil, "X"],
        ]
    end

    def []=(location, piece) #Operator Overloading
        row, column = location
        grid[row][column] = piece
    end

    def [](location)
        row, column = location
        grid[row][column]
    end

    def in_bounds?(location)
        row, column = location
        row < grid.length && column < grid.first.length && row >= 0 && column >= 0
    end
end



# place pieces
# out of bounds
# get a piece at spesific position

# Operator Overloading. Exp: a = [1, 2, 3]
# a.[](0)  => This is getter method for array
# a.[]=(2, "lol") => This is setter method for array
