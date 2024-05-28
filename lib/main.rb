require_relative 'board_renderer_text'
require_relative 'board'
require_relative 'game'
require_relative 'player'

# TODO:
#   add logic for "moving and taking a piece"
#   add logic for "won"
#   add logic for taking turns

# board = Board.new
# b[[1, 2]] = Pawn.new(b, [1, 2],:black)
# b[[1, 6]] = Rook.new(b, [1, 6],:black)
# b[[1, 4]] = Rook.new(b, [1, 4],:white)

# b = Board.start_chess
# text_board = BoardRendererText.new(b)
# piece = b[[1, 2]]
# p piece.available_moves
# puts text_board.render

game = Game.new(Player.new(:black), Player.new(:white))
game.play