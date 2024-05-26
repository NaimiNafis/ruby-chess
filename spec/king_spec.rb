require './lib/chess_pieces/king'

describe King do
    describe "to_s" do
        it "return king emoji ♔ if :black" do
            king = King.new(:black)
            expect(king.to_s).to eql("♔")
        end

        it "return king emoji ♚ if :white" do
            king = King.new(:white)
            expect(king.to_s).to eql("♚")
        end
    end
end