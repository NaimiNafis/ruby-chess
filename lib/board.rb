require_relative 'chess_pieces/chess_pieces'

class Board

    attr_reader :grid 

    def initialize( n = 8 )
        @grid = Array.new(n) { Array.new(n) }
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


# class Board only used for maintaining internal represatation, having a little validation logic
# place pieces
# out of bounds
# get a piece at spesific position

# Operator Overloading. Exp: a = [1, 2, 3]
# a.[](0)  => This is getter method for array
# a.[]=(2, "lol") => This is setter method for array
