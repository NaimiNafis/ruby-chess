require_relative 'piece'

class Knight < Piece

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