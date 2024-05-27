require_relative '../lib/chess_pieces/pawn'
require_relative '../lib/chess_pieces/piece'
require_relative '../lib/board'

describe Pawn do
    describe "to_s" do
        it "return pawn emoji ♙ if :black" do
            pawn = Pawn.new(self, [1, 2], :black)
            expect(pawn.to_s).to eql("♙")
        end

        it "return pawn emoji ♟ if :white" do
            pawn = Pawn.new(self, [6, 2], :white)
            expect(pawn.to_s).to eql("♟")
        end
    end
end