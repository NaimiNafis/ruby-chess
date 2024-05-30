# frozen_string_literal: true

# The Game class manages the overall flow of the chess game. It handles
# player turns, checks for check and checkmate conditions, and interfaces
# with the board and renderer to display the game state.

require_relative './modules/save_manager'
require_relative './modules/notation_converter'
require_relative './modules/display'
require_relative 'invalid_move_error'

class Game
  include NotationConverter
  include SaveManager
  include Display

  attr_reader :board, :player1, :player2
  attr_accessor :current_player

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @turn_count = 0
  end

  def swap_player!
    self.current_player = current_player == player1 ? player2 : player1
  end

  def save_game
    SaveManager.save(self)
  end

  def self.load_game
    SaveManager.load
  end

  def play
    loop do
      Display.render_board(board)
      display_turn_info

      if game_over?
        display_winner
        break
      end

      take_turn
      swap_player!
      @turn_count += 1

      prompt_save_game if @turn_count % 5 == 0
    end

    Display.render_board(board)
    puts "\nGame Over! The winner is: #{current_player.color.capitalize}!\n"
  end

  private

  def display_turn_info
    puts "It's #{current_player.color.capitalize}'s turn"
    if board.checkmate?(current_player.color)
      puts "#{current_player.color.capitalize} is in checkmate!"
    elsif board.in_check?(current_player.color)
      puts "#{current_player.color.capitalize} is in check!"
    end
  end

  def game_over?
    board.checkmate?(current_player.color)
  end

  def display_winner
    swap_player!
    puts "#{current_player.color.capitalize} is in checkmate!"
  end

  def take_turn
    start_pos = select_start_position
    end_pos = select_end_position(start_pos)

    board.move_piece(start_pos, end_pos)
    rescue InvalidMoveError => e
      puts e.message
      retry
  end

  def select_start_position
    loop do
      puts 'Select a piece to move: '
      start_pos = current_player.get_pos

      piece = board[start_pos]
      if piece.nil?
        puts 'There is no piece at the selected position.'
      elsif piece.color != current_player.color
        puts "Did not select a #{current_player.color} piece."
      elsif piece.available_moves.empty?
        puts 'There are no available moves for this piece.'
      else
        available_moves = piece.available_moves.map { |move| coordinate_to_notation(move) }
        puts "Available moves: #{available_moves.join(', ')}"
        return start_pos
      end
    end
  end

  def select_end_position(start_pos)
    loop do
      puts 'Select a position to move: '
      end_pos = current_player.get_pos

      piece = board[start_pos]
      if piece.available_moves.include?(end_pos)
        return end_pos
      else
        puts 'Invalid move, try again.'
      end
    end
  end

  def prompt_save_game
    puts 'Do you want to save the game? (y/n)'
    answer = gets.chomp.downcase
    save_game if answer == 'y'
  end
end
