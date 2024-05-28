require_relative 'board_renderer_text'
require_relative 'board'

# use board.start_chess for factory set instead because let say we want to
# test how any piece move in empty board, we can just call Board.new
b = Board.start_chess
# board = Board.new
text_board = BoardRendererText.new(b)

b[[2, 5]] = Pawn.new(b, [2, 5],:black)
# b[[1, 6]] = Rook.new(b, [1, 6],:black)
# b[[1, 4]] = Rook.new(b, [1, 4],:white)

piece = b[[2, 5]]
p piece.available_moves

puts text_board.render