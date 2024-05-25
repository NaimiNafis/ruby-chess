class Board

    attr_reader :grid 
    
    def initialize
        @grid = [
            ["X", "X", nil, "X"],
            ["X", "X", nil, "X"],
            ["X", "X", nil, "X"],
            ["X", "X", nil, "X"],
        ]
    end

    def place(piece, location)
      row, column = location
    end

    def inbound?
        
    end

    def get_piece(location)
        
    end
end

# place pieces
# out of bounds
# get a piece at spesific position