require_relative 'invalid_move_error'
require_relative 'board_renderer_text'
require_relative 'board'
require_relative 'player'
require_relative 'game'

# TODO:
#   add logic for "won"

# board = Board.new
# b[[1, 2]] = Pawn.new(b, [1, 2],:black)
# b[[1, 6]] = Rook.new(b, [1, 6],:black)
# b[[1, 4]] = Rook.new(b, [1, 4],:white)

# b = Board.start_chess
# text_board = BoardRendererText.new(b)
# piece = b[[1, 2]]
# p piece.available_moves
# puts text_board.render

b = Board.start_chess
game = Game.new(b, Player.new(:black), Player.new(:white), BoardRendererText)
game.play