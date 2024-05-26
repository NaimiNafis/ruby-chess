class Rook

    attr_reader :color
    
    def initialize(location, color)
        @location = location
        @color = color
    end

    def to_s
        color == :black ? "♖" : "♜" 
    end

    def move_directions
        [
            [1, 0],
            [-1, 0],
            [0, 1],
            [0, -1],
        ]
    end

    def row #getter
        @location.first
    end

    def column #getter
        @location.last
    end
end