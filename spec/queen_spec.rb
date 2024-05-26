require './lib/chess_pieces/queen'

describe Queen do
    describe "to_s" do
        it "return queen emoji ♕ if :black" do
            queen = Queen.new(:black)
            expect(queen.to_s).to eql("♕")
        end

        it "return queen emoji ♛ if :white" do
            queen = Queen.new(:white)
            expect(queen.to_s).to eql("♛")
        end
    end
end