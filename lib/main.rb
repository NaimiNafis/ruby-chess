require_relative 'invalid_move_error'
require_relative 'board_renderer_text'
require_relative 'board'
require_relative 'player'
require_relative 'game'

# TODO:
#   add logic for "won"

b = Board.new
b[[6, 6]] = King.new(b, [6, 6], :white)
b[[1, 1]] = King.new(b, [1, 1], :black)
b[[2, 2]] = Queen.new(b, [2, 2], :white)

# b = Board.start_chess
# text_board = BoardRendererText.new(b)
# piece = b[[1, 2]]
# p piece.available_moves
# puts text_board.render

# b = Board.start_chess
game = Game.new(b, Player.new(:black), Player.new(:white), BoardRendererText)
game.play