module Stepable

    def available_moves
        moves = []
        move_directions.each do |(dr, dc)|
            current_row, current_column = location
    
            current_row += dr
            current_column += dc
            loc = [current_row, current_column]
            next if !board.in_bounds?(loc)
            if board.empty?(loc) || enemy?(loc)
                moves << loc
            elsif !board.empty?(loc) && !enemy?(loc)
                next
            end 
        end
        moves
    end
    
end
