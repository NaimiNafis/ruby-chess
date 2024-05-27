require_relative '../lib/chess_pieces/rook'
require_relative '../lib/chess_pieces/piece'
require_relative '../lib/board'

describe Rook do
    describe "to_s" do
        it "return rook emoji ♖ if :black" do
            rook = Rook.new(self, [0, 0], :black)
            expect(rook.to_s).to eql("♖")
        end

        it "return rook emoji ♜ if :white" do
            rook = Rook.new(self, [7, 0], :white)
            expect(rook.to_s).to eql("♜")
        end
    end
end