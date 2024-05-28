require_relative '../lib/board'
require_relative '../lib/chess_pieces/chess_pieces'

describe Board do
    let(:board) { Board.new }

    describe "#[]=" do
        it "sets a piece on the board at a specific location" do
            location = [0, 0]
            expected_result = Array.new(8) { Array.new(8) }
            expected_result[0][0] = "Y"
            board[location] = "Y"
            expect(board.grid).to eql(expected_result)
        end

        it "returns nil for any location marked nil" do
            board[[1, 2]] = nil
            location = [1, 2]
            expect(board[location]).to eql(nil)
        end
    end

    describe "#[]" do
        it "gets a piece from the board at a specific location" do
            location = [0, 0]
            board[location] = "Y"
            expect(board[location]).to eql("Y")
        end
    end

    describe "#in_bounds?" do
        it "returns true if the location is within bounds" do
            location = [0, 0]
            expect(board.in_bounds?(location)).to eql(true)
        end

        it "returns false if the location is out of bounds" do
            location = [-1, -2]
            expect(board.in_bounds?(location)).to eql(false)
        end
    end

    describe "#[]" do
        it "gets pieces using location on grid" do
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
                ["♜", "♞", "♝", "♛", nil, nil, nil, nil],
                ["♚", "♟", "♟", "♟", nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, "♙", nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil]
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

    describe "#move_pieces" do
        context "when moving a piece within its available moves" do
            xit "moves the piece to the new position" do
                black_pawn = Pawn.new(board, [1, 2], :black)
                board[[1, 2]] = black_pawn
                board.move_pieces([1, 2], [2, 2])
                expect(board[[2, 2]]).to eq(black_pawn)
                expect(board[[1, 2]]).to be_nil
                expect(black_pawn.location).to eq([2, 2])
            end
        end

        context "when trying to move a piece to an invalid position" do
            xit "raises an error" do
                black_pawn = Pawn.new(board, [1, 2], :black)
                board[[1, 2]] = black_pawn
                expect { board.move_pieces([1, 2], [3, 3]) }.to raise_error("Invalid move")
            end
        end

        context "when capturing an enemy piece" do
            xit "moves the piece and removes the enemy piece" do
                black_pawn = Pawn.new(board, [1, 2], :black)
                enemy_piece = Pawn.new(board, [2, 1], :white)
                board[[1, 2]] = black_pawn
                board[[2, 1]] = enemy_piece
                board.move_pieces([1, 2], [2, 1])
                expect(board[[2, 1]]).to eq(black_pawn)
                expect(board[[1, 2]]).to be_nil
                expect(black_pawn.location).to eq([2, 1])
            end
        end

        context "when trying to move a piece out of bounds" do
            xit "raises an error" do
                black_pawn = Pawn.new(board, [1, 2], :black)
                board[[1, 2]] = black_pawn
                expect { board.move_pieces([1, 2], [-1, -1]) }.to raise_error("Invalid move")
            end
        end

        context "when moving a piece to an occupied position by the same color" do
            xit "raises an error" do
                black_pawn = Pawn.new(board, [1, 2], :black)
                blocking_piece = Pawn.new(board, [2, 2], :black)
                board[[1, 2]] = black_pawn
                board[[2, 2]] = blocking_piece
                expect { board.move_pieces([1, 2], [2, 2]) }.to raise_error("Invalid move")
            end
        end
    end
end
