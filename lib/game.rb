class Game

    attr_reader :board, :player1, :player2, :renderer
    attr_accessor :current_player

    def initialize(board, player1, player2, renderer_class)
        @board = board
        @renderer = renderer_class.new(board)
        @player1 = player1
        @player2 = player2
        @current_player = @player1
    end

    def swap_player!
        # Use self.current_player to call the setter method
        self.current_player = (current_player == player1) ? player2 : player1
    end

    def play
        loop do
            renderer.render
            puts "It's #{current_player.color}'s turn"

            if board.checkmate?(current_player.color)
                puts "#{current_player.color.capitalize} is in checkmate!"
                break
            elsif board.in_check?(current_player.color)
                puts "#{current_player.color.capitalize} is in check!"
            end

            take_turn

            if board.checkmate?(current_player.color)
                renderer.render
                puts "#{current_player.color.capitalize} is in checkmate!"
                break
            elsif board.in_check?(current_player.color)
                puts "#{current_player.color.capitalize} is in check!"
            end

            swap_player!
        end
        
        renderer.render
        swap_player!
        puts "\nGame Over! The winner is: #{current_player.color.capitalize}!\n"
    end

    def take_turn
        start_pos = nil
        
        # prompt start pos
        loop do
            puts "Select a piece to move: "
            start_pos = current_player.get_pos
            if !board[start_pos].nil? && board[start_pos].color != current_player.color
                break
            end
            puts "Did not select a #{current_player.color} piece."
        end

        # prompt end pos
        loop do
            puts "Select a position to move: "
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
