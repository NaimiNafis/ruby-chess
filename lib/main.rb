require_relative 'invalid_move_error'
require_relative 'board_renderer_text'
require_relative 'board'
require_relative 'player'
require_relative 'game'

b = Board.start_chess
game = Game.new(b, Player.new(:white), Player.new(:black), BoardRendererText)
game.play

# TODO:
#   if available_moves = [], loop back, ask for other piece
#   add seriliazable yaml module, collect all module in one folder
#   change notation like e2e3 following the true chess notation
#   give move suggestion before input