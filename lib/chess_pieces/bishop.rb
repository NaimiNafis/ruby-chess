class Bishop < Piece

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