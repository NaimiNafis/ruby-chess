class Pawn < Piece

    include Stepable
    
    def to_s
        # when do comparisons, it better to use symbol than string 
        # bcs it'll helps in managing memory
        color == :black ? "♙" : "♟" 
    end

    def move_directions
        [[0, 1]]
    end

end


# move forward 2 or 1 space
# define pawn directions
# string represantation for pawn