require './lib/pawn'

describe Pawn do
    describe "to_s" do
        it "return pawn emoji ♙ if :black" do
            pawn = Pawn.new(:black)
            expect(pawn.to_s).to eql("♙")
        end

        it "return pawn emoji ♟ if :white" do
            pawn = Pawn.new(:white)
            expect(pawn.to_s).to eql("♟")
        end
    end
end