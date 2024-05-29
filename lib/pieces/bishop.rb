require_relative 'piece'
require_relative '../modules/slideable'

class Bishop < Piece

    include Slideable
    
    def to_s
        color == :black ? "♗" : "♝" 
    end

    def move_directions
        [
            [1, 1],
            [1, -1],
            [-1, 1],
            [-1, -1],
        ]
    end

end