require './lib/rook'

describe Rook do
    describe "to_s" do
        it "return rook emoji ♖ if :black" do
            rook = Rook.new([0, 1], :black)
            expect(rook.to_s).to eql("♖")
        end

        it "return rook emoji ♜ if :white" do
            rook = Rook.new([1, 1], :white)
            expect(rook.to_s).to eql("♜")
        end
    end
end