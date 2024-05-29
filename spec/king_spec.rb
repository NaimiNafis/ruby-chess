require_relative '../lib/pieces/king'
require_relative '../lib/pieces/piece'
require_relative '../lib/board'

describe King do
    describe "to_s" do
        it "return king emoji ♔ if :black" do
            king = King.new(self, [0, 4], :black)
            expect(king.to_s).to eql("♔")
        end

        it "return king emoji ♚ if :white" do
            king = King.new(self, [7, 4], :white)
            expect(king.to_s).to eql("♚")
        end
    end
end