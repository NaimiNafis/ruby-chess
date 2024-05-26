require './lib/board_renderer_text'


describe BoardRendererText do
    describe "render" do
      it "returns a rendered grid board" do
        board = Board.new(4)
        board[[0, 0]] = Rook.new(:white)
        board[[0, 1]] = Knight.new(:white)
        board[[0, 2]] = Bishop.new(:white)
        board[[0, 3]] = Queen.new(:white)
        board[[1, 0]] = King.new(:white)
        board[[1, 1]] = Pawn.new(:white)
        board[[1, 2]] = Pawn.new(:white)
        board[[1, 3]] = Pawn.new(:white)
        board[[2, 3]] = Pawn.new(:black)
  
        text_board = BoardRendererText.new(board)
  
        expected_result = <<~BOARD.chomp
              a   b   c   d
            +---+---+---+---+
          4 | ♜ | ♞ | ♝ | ♛ | 4
            +---+---+---+---+
          3 | ♚ | ♟ | ♟ | ♟ | 3
            +---+---+---+---+
          2 | . | . | . | ♙ | 2
            +---+---+---+---+
          1 | . | . | . | . | 1
            +---+---+---+---+
              a   b   c   d
        BOARD
  
        expect(text_board.render).to eq(expected_result)
      end
    end
  end
  
  
  
  