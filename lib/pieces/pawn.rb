require_relative 'piece'

class Pawn < Piece

    def forward_direction
        color == :black ? 1 : -1 
    end

    def at_start?
        color == :black && current_row == 1 ||
        color == :white && current_row == 6
    end

    def available_moves
        moves = []
        one_forward = [current_row + forward_direction, current_column]

        # move forward 1
        # [0, 1] = [0, 2] 
        if board.empty?(one_forward)
            moves << one_forward
        end

        # if on start line, can move forward 2
        # [0, 1] = [0, 2] / [0, 3]
        if board.empty?(one_forward) && at_start?
            two_forward = [current_row + forward_direction * 2, current_column]
            if board.empty?(two_forward)
                moves << two_forward
            end
        end

        # if enemy diag, can move to there
        diag_left = [current_row + forward_direction, current_column + 1]
        diag_right = [current_row + forward_direction, current_column - 1]
        if board.in_bounds?(diag_left) && enemy?(diag_left)
            moves << diag_left
        end
        if board.in_bounds?(diag_right) && enemy?(diag_right)
            moves << diag_right
        end

        # find if inbounds on board

        moves.select { |move|  board.in_bounds?(move) }

    end

    def to_s
        # when do comparisons, it better to use symbol than string 
        # bcs it'll helps in managing memory
        color == :black ? "♙" : "♟" 
    end

end
