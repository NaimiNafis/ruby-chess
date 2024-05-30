# frozen_string_literal: true

# The main entry point for the chess application. This script sets up the
# game by initializing the board, players, and renderer, and then starts
# the game loop.
require_relative './modules/save_manager'
require_relative './modules/display'
require_relative './modules/notation_converter'
require_relative './modules/slideable'
require_relative './modules/stepable'
require_relative './pieces/piece'
require_relative './pieces/queen'
require_relative './pieces/rook'
require_relative './pieces/bishop'
require_relative './pieces/king'
require_relative './pieces/knight'
require_relative './pieces/pawn'
require_relative './board'
require_relative './player'
require_relative './game'

# Initialize components and start the game
include Display
include SaveManager


def main_menu
    Display.main_menu
end

def start_game
    board = Board.start_chess
    player1 = Player.new(:white)
    player2 = Player.new(:black)
    game = Game.new(board, player1, player2)
    game.play
end

def load_game
    game = Game.load_game
    if game
        game.play
    else
        puts "Failed to load game."
    end
end

loop do
    case main_menu
    when 1
        start_game
    when 2
        load_game
    when 3
        puts "Goodbye!"
        break
    else
        puts "Invalid option, please try again."
    end
end