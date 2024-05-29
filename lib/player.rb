class Player

    attr_reader :color

    def initialize(color)
        @color = color
    end

    def get_pos
      gets.chomp.split("").map { |part| part.to_i }
    end

    # get_pos to return an array of integer: [2, 2]
    # we want to ask notation(i.e: e1), change it to coordinate
    
    # input: a1 = desired_output: [7,0]
    # gets.chomp
    # split = ["a", "1"] = column, row
    # row: 8 - "1".to_i
    # column: 'letter'.ord - 'a'.ord so, a = 0, b = 1, etc.

end
