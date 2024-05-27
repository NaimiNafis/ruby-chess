require_relative '../lib/chess_pieces/bishop'
require_relative '../lib/chess_pieces/piece'
require_relative '../lib/board'

describe Bishop do
    describe "to_s" do
        it "return bishop emoji ♗ if :black" do
            bishop = Bishop.new(self, [0, 2], :black)
            expect(bishop.to_s).to eql("♗")
        end

        it "return bishop emoji ♝ if :white" do
            bishop = Bishop.new(self, [7, 2], :white)
            expect(bishop.to_s).to eql("♝")
        end
    end
end