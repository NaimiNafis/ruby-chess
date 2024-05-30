# frozen_string_literal: true

# The Game class manages the overall flow of the chess game. It handles
# player turns, checks for check and checkmate conditions, and interfaces
# with the board and renderer to display the game state.

require_relative './modules/notation_converter'
require_relative './modules/display'

class Game
  include NotationConverter
  include Display

  attr_reader :board, :player1, :player2, :renderer
  attr_accessor :current_player

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def swap_player!
    # Use self.current_player to call the setter method
    self.current_player = current_player == player1 ? player2 : player1
  end

  def play
    loop do
      Display.render_board(board)
      puts "It's #{current_player.color.capitalize}'s turn"

      if board.checkmate?(current_player.color)
        puts "#{current_player.color.capitalize} is in checkmate!"
        break
      elsif board.in_check?(current_player.color)
        puts "#{current_player.color.capitalize} is in check!"
      end

      take_turn

      if board.checkmate?(current_player.color)
        Display.render_board(board)
        puts "#{current_player.color.capitalize} is in checkmate!"
        break
      elsif board.in_check?(current_player.color)
        puts "#{current_player.color.capitalize} is in check!"
      end

      swap_player!
    end

    Display.render_board(board)
    swap_player!
    puts "\nGame Over! The winner is: #{current_player.color.capitalize}!\n"
  end

  def take_turn
    start_pos = nil

    loop do
      puts 'Select a piece to move: '
      start_pos = current_player.get_pos

      if board[start_pos].nil?
        puts 'There is no piece at the selected position.'
        next
      end

      if board[start_pos].color != current_player.color
        puts "Did not select a #{current_player.color} piece."
        next
      end

      if board[start_pos].available_moves.empty?
        puts 'There are no available moves for this piece.'
        next
      end

      available_moves = board[start_pos].available_moves.map { |move| coordinate_to_notation(move) }
      puts "Available moves: #{available_moves.join(', ')}"

      break
    end

    loop do
      puts 'Select a position to move: '
      end_pos = current_player.get_pos

      begin
        board.move_piece(start_pos, end_pos)
        break
      rescue InvalidMoveError => e
        puts e.message
      end
    end
  end
end
