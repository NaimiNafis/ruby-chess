class Piece
    
    attr_reader :color, :location, :board
    
    def initialize(board, location, color)
        @color = color
        @board = board
        @location = location
    end

    def enemy?(location)
      !board[location].nil? && board[location].color != color 
    end

end
