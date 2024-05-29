class Player

    attr_reader :color

    def initialize(color)
      @color = color
    end

    def get_pos
      input = gets.chomp
      notation_to_coordinate(input)
    end

    def notation_to_coordinate(notation)
      letter, number = notation.split("")

      column = letter_to_column(letter)
      row = 8 - number.to_i

      [row, column]
    end

    def letter_to_column(letter)
      letter.ord - 'a'.ord
    end

end
