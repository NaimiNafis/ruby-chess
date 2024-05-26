require './lib/chess_pieces/knight'

describe Knight do
    describe "to_s" do
        it "return knight emoji ♘ if :black" do
            knight = Knight.new(:black)
            expect(knight.to_s).to eql("♘")
        end

        it "return knight emoji ♞ if :white" do
            knight = Knight.new(:white)
            expect(knight.to_s).to eql("♞")
        end
    end
end