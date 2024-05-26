require './lib/chess_pieces/rook'

describe Rook do
    describe "to_s" do
        it "return rook emoji ♖ if :black" do
            rook = Rook.new(:black)
            expect(rook.to_s).to eql("♖")
        end

        it "return rook emoji ♜ if :white" do
            rook = Rook.new(:white)
            expect(rook.to_s).to eql("♜")
        end
    end
end