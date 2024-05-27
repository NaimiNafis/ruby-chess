require_relative 'board_renderer_text'
require_relative 'board'

# use board.start_chess for factory set instead because let say we want to
# test how any piece move in empty board, we can just call Board.new
b = Board.new
# board = Board.new
text_board = BoardRendererText.new(b)

b[[6, 0]] = Pawn.new(b, :white)
b[[5, 0]] = Pawn.new(b, :black)

piece = b[[6, 0]]
p piece.enemy?([4, 0])

puts text_board.render