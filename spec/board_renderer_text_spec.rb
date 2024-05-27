require_relative '../lib/board_renderer_text'
require_relative '../lib/board'


describe BoardRendererText do
    describe "render" do
      it "returns a rendered grid board" do
        board = Board.new(4)
        board[[0, 0]] = Rook.new(board, [0, 0], :white)
        board[[0, 1]] = Knight.new(board, [0, 1], :white)
        board[[0, 2]] = Bishop.new(board, [0, 2], :white)
        board[[0, 3]] = Queen.new(board, [0, 3], :white)
        board[[1, 0]] = King.new(board, [1, 0], :white)
        board[[1, 1]] = Pawn.new(board, [1, 1], :white)
        board[[1, 2]] = Pawn.new(board, [1, 2], :white)
        board[[1, 3]] = Pawn.new(board, [1, 3], :white)
        board[[2, 3]] = Pawn.new(board, [2, 3], :black)
  
        text_board = BoardRendererText.new(board)
  
        expected_result = <<~BOARD
              a   b   c   d
            +---+---+---+---+
          4 | ♜ | ♞ | ♝ | ♛ | 4
            +---+---+---+---+
          3 | ♚ | ♟ | ♟ | ♟ | 3
            +---+---+---+---+
          2 |   |   |   | ♙ | 2
            +---+---+---+---+
          1 |   |   |   |   | 1
            +---+---+---+---+
              a   b   c   d
        BOARD
  
        expect(text_board.render).to eq(expected_result)
      end
    end
  end
  
  
  
  