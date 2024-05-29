class Player

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

  def notation_to_coordinate(notation)
      col = notation[0].ord - 'a'.ord
      row = 8 - notation[1].to_i
      [row, col]
  end
end
