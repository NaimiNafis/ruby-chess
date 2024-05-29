require_relative 'piece'
require_relative '../module/slideable'

class Rook < Piece

    include Slideable
    
    def to_s
        color == :black ? "♖" : "♜" 
    end

    def move_directions
        [
            [1, 0],
            [-1, 0],
            [0, 1],
            [0, -1],
        ]
    end

end