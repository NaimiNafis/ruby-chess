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

    def in_check?(color)
        king = pieces.find { |p| p.color == color && p.is_a?(King) }
        king_pos = king.location

        return false if king_pos.nil?
    
        # Loop over all the pieces of the opposite color
        pieces.select { |p| p.color != color }.each do |piece|
          # If any piece has an available move with the position
          # of the king with color, then color is in check.
          return true if piece.available_moves.include?(king_pos)
        end
    
        false
    end

    def pieces(color = nil)
        all_pieces = grid.flatten.compact
        return all_pieces if color.nil?
        all_pieces.select { |piece| piece.color == color }
    end

    def checkmate?(color)
        return false if !in_check?(color)
    
        # Iterate over all pieces of the given color
        pieces(color).each do |piece|
          piece.available_moves.each do |move|
            # Make a hypothetical move
            original_position = piece.location
            destination_piece = self[move]
    
            self[move] = piece
            self[original_position] = nil
            piece.location = move
    
            # Check if the move leaves the king still in check
            if !in_check?(color)
              # Undo the hypothetical move
              self[original_position] = piece
              self[move] = destination_piece
              piece.location = original_position
              return false
            end
    
            # Undo the hypothetical move
            self[original_position] = piece
            self[move] = destination_piece
            piece.location = original_position
          end
        end
        # If no valid moves were found to escape check, it's checkmate!
        true
    end

    def move_piece(start_pos, end_pos)

        piece = self[start_pos]
        raise InvalidMoveError.new("No piece at #{start_pos}") if piece.nil?
        
        if !in_bounds?(end_pos)
        raise InvalidMoveError.new("End position not in bounds.")
        end

        if !piece.available_moves.include?(end_pos)
        raise InvalidMoveError.new(
            "End position (#{end_pos}) is not in available moves: #{piece.available_moves}"
        )
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