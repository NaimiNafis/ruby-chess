require_relative 'piece'

class Knight < Piece

    include Stepable
    
    def to_s
        color == :black ? "♘" : "♞" 
    end

    def move_directions
        [
            [2, 1], [2, -1], [-2, 1], [-2, -1],
            [1, 2], [1, -2], [-1, 2], [-1, -2]
        ]
    end

end