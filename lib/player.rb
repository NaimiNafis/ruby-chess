require_relative './modules/notation_converter'

class Player
  include NotationConverter

  attr_reader :color

  def initialize(color)
    @color = color
  end

  def get_pos
    loop do
      puts "Enter a position (e.g., a1, g4): "
      input = gets.chomp
      if valid_input?(input)
        return notation_to_coordinate(input)
      else
        puts "Invalid input. Please enter a valid position (e.g., a1, g4)."
      end
    end
  end

  private

  def valid_input?(input)
    input.match?(/^[a-h][1-8]$/)
  end
end
