require './lib/chess_pieces/bishop'

describe Bishop do
    describe "to_s" do
        it "return bishop emoji ♗ if :black" do
            bishop = Bishop.new(:black)
            expect(bishop.to_s).to eql("♗")
        end

        it "return bishop emoji ♝ if :white" do
            bishop = Bishop.new(:white)
            expect(bishop.to_s).to eql("♝")
        end
    end
end