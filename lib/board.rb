require_relative 'chess_pieces/chess_pieces'

class Board

    attr_reader :grid 

    # factory method 
    def self.start_chess

        board = self.new

        8.times do |column|
            board[[1, column]] = Pawn.new(:black).to_s
            board[[6, column]] = Pawn.new(:white).to_s
        end

        # inside do |()|, if we use (), it wil destructured the element inside
        [[0, :black], [7, :white]].each do |(row, colour)|
            board[[row, 0]] = Rook.new(colour).to_s
            board[[row, 7]] = Rook.new(colour).to_s
            board[[row, 1]] = Knight.new(colour).to_s
            board[[row, 6]] = Knight.new(colour).to_s
            board[[row, 2]] = Bishop.new(colour).to_s
            board[[row, 5]] = Bishop.new(colour).to_s
            board[[row, 3]] = Queen.new(colour).to_s
            board[[row, 4]] = King.new(colour).to_s
        end

        board
    end

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