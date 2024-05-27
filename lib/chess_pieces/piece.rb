class Piece
    
    attr_reader :color, :board
    
    def initialize(board, color)
        @color = color
        @board = board
    end

    def enemy?(location)
      !board[location].nil? && board[location].color != color 
    end

end
