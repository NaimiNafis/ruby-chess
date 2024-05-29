# frozen_string_literal: true

# The Slideable module provides functionality for pieces that move
# in straight lines (e.g., rooks, bishops, and queens) in a chess game.
module Slideable
  def available_moves
    moves = []
    move_directions.each do |(dr, dc)|
      current_row, current_column = location

      loop do
        current_row += dr
        current_column += dc
        loc = [current_row, current_column]
        break unless board.in_bounds?(loc)

        if board.empty?(loc)
          moves << loc
        elsif enemy?(loc)
          moves << loc
          break
        elsif !board.empty?(loc) && !enemy?(loc)
          break
        end
      end
    end
    moves
  end
end
