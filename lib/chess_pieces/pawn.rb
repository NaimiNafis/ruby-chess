require_relative 'piece'

class Pawn < Piece

    def available_moves
        moves = []
        current_row, current_column = location

        # if on start line, can move forward 2
         # [0, 1] = [0, 2] / [0, 3]
        if current_row == 1 || current_row == 6
            2.times do
                current_column += 1
                loc = [current_row, current_column]
                moves << loc
            end
        else
        # move forward 1
        # [0, 1] = [0, 2] 
            current_column += 1
            loc = [current_row, current_column]
            moves << loc
        end
        # if enemy diag, can move to there
        diagonal_moves.each do |dr, dc|
            diag_pos = [current_row + dr, current_column + dc]
            if !board.empty?(diag_pos) && board[diag_pos].color != color
              moves << diag_pos
            end
          end
        moves
    end

    def to_s
        # when do comparisons, it better to use symbol than string 
        # bcs it'll helps in managing memory
        color == :black ? "♙" : "♟" 
    end

    def diagonal_moves
        [
            [1, 1],
            [-1, 1]
        ]
    end

end
