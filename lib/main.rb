require_relative 'invalid_move_error'
require_relative 'board_renderer_text'
require_relative 'board'
require_relative 'player'
require_relative 'game'

b = Board.start_chess
game = Game.new(b, Player.new(:black), Player.new(:white), BoardRendererText)
game.play