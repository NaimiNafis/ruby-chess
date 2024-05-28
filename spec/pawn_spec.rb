require_relative '../lib/chess_pieces/pawn'
require_relative '../lib/chess_pieces/piece'
require_relative '../lib/board'

describe Pawn do
    let(:board) { Board.new }
    let(:black_pawn) { Pawn.new(board, [1, 2], :black) }
    let(:white_pawn) { Pawn.new(board, [6, 2], :white) }

    describe "#to_s" do
        it "returns pawn emoji ♙ if black" do
            expect(black_pawn.to_s).to eql("♙")
        end

        it "returns pawn emoji ♟ if white" do
            expect(white_pawn.to_s).to eql("♟")
        end
    end

    describe "#available_moves" do
        context "when pawn is at its starting position" do
            it "allows moving one step forward if the path is clear" do
                board[[1, 2]] = black_pawn
                expect(black_pawn.available_moves).to include([2, 2])
            end

            it "allows moving two steps forward if the path is clear" do
                board[[1, 2]] = black_pawn
                expect(black_pawn.available_moves).to include([3, 2])
            end
        end

        context "when the path is blocked" do
            it "does not allow moving forward" do
                blocking_piece = Pawn.new(board, [2, 2], :black)
                board[[1, 2]] = black_pawn
                board[[2, 2]] = blocking_piece
                expect(black_pawn.available_moves).to be_empty
            end
        end

        context "when capturing an enemy piece" do
            it "allows moving diagonally if there is an enemy piece" do
                enemy_piece = Pawn.new(board, [2, 1], :white)
                board[[1, 2]] = black_pawn
                board[[2, 1]] = enemy_piece
                expect(black_pawn.available_moves).to include([2, 1])
            end
        end

        context "when at the edge of the board" do
            it "does not move off the board" do
                board[[7, 7]] = black_pawn
                expect(black_pawn.available_moves).not_to include([8, 7])
            end
        end

        context "when no enemy piece is diagonal" do
            it "does not allow moving diagonally if there is no enemy piece" do
                board[[1, 2]] = black_pawn
                expect(black_pawn.available_moves).not_to include([2, 1])
                expect(black_pawn.available_moves).not_to include([2, 3])
            end
        end
    end
end
