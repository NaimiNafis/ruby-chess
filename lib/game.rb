class Game

    attr_reader :player1, :player2
    attr_accessor :current_player

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @current_player = @player1
    end

    def swap!
        current_player == player1 ? player2 : player1
    end

    def play
        puts "It's #{current_player.color} turn"
        
        puts "Select a piece to move: "
        start_pos = current_player.get_pos
        p start_pos

        puts "Select a position to move: "
        end_pos = current_player.get_pos
        p end_pos
    end

end
