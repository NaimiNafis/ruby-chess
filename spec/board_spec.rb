require_relative '../lib/board'
require_relative '../lib/chess_pieces/chess_pieces'

describe Board do
    describe "#[]=" do
        it "get any pieces using location on grid" do
            board = Board.new(4)
            location = [0, 0]
            expected_result = [
                ["Y", nil, nil, nil],
                [nil, nil, nil, nil],
                [nil, nil, nil, nil],
                [nil, nil, nil, nil],
            ]
            board[location] = "Y"
            expect(board.grid).to eql(expected_result)
        end

        it "return nil on any location marked nil" do
            board = Board.new
            location = [1, 2]
            expect(board[location]).to eql(nil)
        end
    end

    describe "#[]" do
        it "set any pieces using location on grid" do
            board = Board.new
            location = [0, 0]
            board[location] = "Y"
            expect(board[location]).to eql("Y")
        end
    end

    describe "#in_bounds?" do
        it "return true if location in bounds" do
            board = Board.new
            location = [0, 0]
            expect(board.in_bounds?(location)).to eql(true)
        end

        it "return false if location out of bounds" do
            board = Board.new
            location = [-1, -2]
            expect(board.in_bounds?(location)).to eql(false)
        end
    end

    describe "#[]" do

        it "get any pieces using location on grid" do
            board = Board.new(4)
            board[[0, 0]] = Rook.new(board, [0, 0], :white)
            board[[0, 1]] = Knight.new(board, [0, 1], :white)
            board[[0, 2]] = Bishop.new(board, [0, 2], :white)
            board[[0, 3]] = Queen.new(board, [0, 3], :white)
            board[[1, 0]] = King.new(board, [1, 0], :white)
            board[[1, 1]] = Pawn.new(board, [1, 1], :white)
            board[[1, 2]] = Pawn.new(board, [1, 2], :white)
            board[[1, 3]] = Pawn.new(board, [1, 3], :white)
            board[[3, 3]] = Pawn.new(board, [3, 3], :black)
            expected_result = [
                ["♜", "♞", "♝", "♛"],
                ["♚", "♟", "♟", "♟"],
                [nil, nil, nil, nil],
                [nil, nil, nil, "♙"],
            ]
            actual_result = board.grid.map { |row| row.map { |piece| piece&.to_s } }
            expect(actual_result).to eql(expected_result)
        end
    end

    describe "#self.start_chess" do
        it "returns a board with all pieces in their starting positions" do
            board = Board.start_chess
            expected_result = [
                ["♖", "♘", "♗", "♕", "♔", "♗", "♘", "♖"],
                ["♙", "♙", "♙", "♙", "♙", "♙", "♙", "♙"],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                ["♟", "♟", "♟", "♟", "♟", "♟", "♟", "♟"],
                ["♜", "♞", "♝", "♛", "♚", "♝", "♞", "♜"]
            ]
            actual_result = board.grid.map { |row| row.map { |piece| piece&.to_s } }
            expect(actual_result).to eql(expected_result)
        end
    end

end
