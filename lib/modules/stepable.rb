# frozen_string_literal: true

# The Stepable module provides functionality for pieces that move
# one step at a time in various directions (e.g., knights, kings) in a chess game.
module Stepable
  def available_moves
    moves = []
    move_directions.each do |(dr, dc)|
      current_row, current_column = location

      current_row += dr
      current_column += dc
      loc = [current_row, current_column]
      next unless board.in_bounds?(loc)

      if board.empty?(loc) || enemy?(loc)
        moves << loc
      elsif !board.empty?(loc) && !enemy?(loc)
        next
      end
    end
    moves
  end
end
