require './lib/board'

describe Board do
    describe "#[]=" do
        it "get any pieces using location on grid" do
            board = Board.new
            location = [0, 0]
            expected_result = [
                ["Y", "X", nil, "X"],
                ["X", "X", nil, "X"],
                ["X", "X", nil, "X"],
                ["X", "X", nil, "X"],
            ]
            board[location] = "Y"
            expect(board.grid).to eql(expected_result)
            expect(board[[1, 1]]).to eql("X")
            expect(board[[1, 2]]).to eql(nil)
        end

        it "return 'X' on any location marked 'X'" do
            board = Board.new
            location = [1, 1]
            expect(board[location]).to eql("X")
        end

        it "return nil on any location marked nil" do
            board = Board.new
            location = [1, 2]
            expect(board[location]).to eql(nil)
        end
    end

    describe "#[]" do
        it "set any pieces using location on grid" do
            board = Board.new
            location = [0, 0]
            board[location] = "Y"
            expect(board[location]).to eql("Y")
        end
    end

    describe "#in_bounds?" do
        it "return true if location in bounds" do
            board = Board.new
            location = [0, 0]
            expect(board.in_bounds?(location)).to eql(true)
        end

        it "return false if location out of bounds" do
            board = Board.new
            location = [-1, -2]
            expect(board.in_bounds?(location)).to eql(false)
        end
    end
end
