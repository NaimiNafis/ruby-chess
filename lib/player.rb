# frozen_string_literal: true

require_relative './modules/notation_converter'

# The Player class represents a player in the chess game. It handles player
# input for selecting and moving pieces, and maintains the player's color.
class Player
  include NotationConverter

  attr_reader :color

  def initialize(color)
    @color = color
  end

  def get_pos
    loop do
      puts 'Enter a position (e.g., a1, g4): '
      input = gets.chomp
      return notation_to_coordinate(input) if valid_input?(input)

      puts 'Invalid input. Please enter a valid position (e.g., a1, g4).'
    end
  end

  private

  def valid_input?(input)
    input.match?(/^[a-h][1-8]$/)
  end
end
