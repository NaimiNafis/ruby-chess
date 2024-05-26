require_relative 'board_renderer_text'
require_relative 'board'

# use board.start_chess for factory set instead because let say we want to
# test how any piece move in empty board, we can just call Board.new
board = Board.start_chess
# board = Board.new
text_board = BoardRendererText.new(board)

puts text_board.render