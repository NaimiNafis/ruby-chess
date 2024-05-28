require_relative 'chess_pieces/chess_pieces'

class Board

    attr_reader :grid 

    # factory method 
    def self.start_chess

        board = self.new

        8.times do |column|
            board[[1, column]] = Pawn.new(board, [1, column], :black)
            board[[6, column]] = Pawn.new(board, [6, column], :white)
        end

        # inside do |()|, if we use (), it wil destructured the element inside
        [[0, :black], [7, :white]].each do |(row, colour)|
            board[[row, 0]] = Rook.new(board, [row, 0], colour)
            board[[row, 7]] = Rook.new(board, [row, 7], colour)
            board[[row, 1]] = Knight.new(board, [row, 1], colour)
            board[[row, 6]] = Knight.new(board, [row, 6], colour)
            board[[row, 2]] = Bishop.new(board, [row, 2], colour)
            board[[row, 5]] = Bishop.new(board, [row, 5], colour)
            board[[row, 3]] = Queen.new(board, [row, 3], colour)
            board[[row, 4]] = King.new(board, [row, 4], colour)
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

    def empty?(location)
        self[location].nil?
    end

    def move_pieces(start_pos, end_pos)

        piece = self[start_pos]
        raise "No piece at #{start_pos}" if piece.nil?

        unless piece.available_moves.include?(end_pos)
            raise "End position (#{end_pos}) is not in available moves: #{piece.available_moves}"
        end

        self[end_pos] = piece
        self[start_pos] = nil
        piece.location = end_pos
    end
end


# class Board only used for maintaining internal represatation, having a little validation logic
# place pieces
# out of bounds
# get a piece at spesific position

# Operator Overloading. Exp: a = [1, 2, 3]
# a.[](0)  => This is getter method for array
# a.[]=(2, "lol") => This is setter method for array