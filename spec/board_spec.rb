# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/invalid_move_error'
require_relative '../lib/pieces'

describe Board do
  let(:board) { Board.new }

  describe '#[]=' do
    it 'sets a piece on the board at a specific location' do
      location = [0, 0]
      expected_result = Array.new(8) { Array.new(8) }
      expected_result[0][0] = 'Y'
      board[location] = 'Y'
      expect(board.grid).to eql(expected_result)
    end

    it 'returns nil for any location marked nil' do
      board[[1, 2]] = nil
      location = [1, 2]
      expect(board[location]).to eql(nil)
    end
  end

  describe '#[]' do
    it 'gets a piece from the board at a specific location' do
      location = [0, 0]
      board[location] = 'Y'
      expect(board[location]).to eql('Y')
    end
  end

  describe '#in_bounds?' do
    it 'returns true if the location is within bounds' do
      location = [0, 0]
      expect(board.in_bounds?(location)).to eql(true)
    end

    it 'returns false if the location is out of bounds' do
      location = [-1, -2]
      expect(board.in_bounds?(location)).to eql(false)
    end
  end

  describe '#[]' do
    it 'gets pieces using location on grid' do
      board[[0, 0]] = Rook.new(board, [0, 0], :white)
      board[[0, 1]] = Knight.new(board, [0, 1], :white)
      board[[0, 2]] = Bishop.new(board, [0, 2], :white)
      board[[0, 3]] = Queen.new(board, [0, 3], :white)
      board[[1, 0]] = King.new(board, [1, 0], :white)
      board[[1, 1]] = Pawn.new(board, [1, 1], :white)
      board[[1, 2]] = Pawn.new(board, [1, 2], :white)
      board[[1, 3]] = Pawn.new(board, [1, 3], :white)
      board[[3, 3]] = Pawn.new(board, [3, 3], :black)
      expected_result = [
        ['♜', '♞', '♝', '♛', nil, nil, nil, nil],
        ['♚', '♟', '♟', '♟', nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, '♙', nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil]
      ]
      actual_result = board.grid.map { |row| row.map { |piece| piece&.to_s } }
      expect(actual_result).to eql(expected_result)
    end
  end

  describe '#self.start_chess' do
    it 'returns a board with all pieces in their starting positions' do
      board = Board.start_chess
      expected_result = [
        ['♖', '♘', '♗', '♕', '♔', '♗', '♘', '♖'],
        ['♙', '♙', '♙', '♙', '♙', '♙', '♙', '♙'],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        ['♟', '♟', '♟', '♟', '♟', '♟', '♟', '♟'],
        ['♜', '♞', '♝', '♛', '♚', '♝', '♞', '♜']
      ]
      actual_result = board.grid.map { |row| row.map { |piece| piece&.to_s } }
      expect(actual_result).to eql(expected_result)
    end
  end

  describe '#move_piece' do
    let(:board) { Board.new }
    let(:white_king) { King.new(board, [7, 4], :white) }
    let(:black_king) { King.new(board, [0, 4], :black) }
    let(:white_rook) { Rook.new(board, [7, 0], :white) }

    before do
      board[[7, 4]] = white_king
      board[[0, 4]] = black_king
      board[[7, 0]] = white_rook
    end

    it 'moves a piece to a new position' do
      board.move_piece([7, 0], [5, 0])
      expect(board[[5, 0]]).to eq(white_rook)
      expect(board[[7, 0]]).to be_nil
    end

    it 'raises an error when there is no piece at the start position' do
      expect { board.move_piece([6, 0], [5, 0]) }.to raise_error(InvalidMoveError, 'No piece at [6, 0]')
    end

    it 'raises an error when the end position is out of bounds' do
      expect { board.move_piece([7, 4], [8, 4]) }.to raise_error(InvalidMoveError, 'End position not in bounds.')
    end
  end

  describe '#pieces' do
    let(:board) { Board.new }
    let(:white_king) { King.new(board, [7, 4], :white) }
    let(:black_king) { King.new(board, [0, 4], :black) }
    let(:white_rook) { Rook.new(board, [7, 0], :white) }
    let(:black_knight) { Knight.new(board, [5, 2], :black) }

    before do
      board[[7, 4]] = white_king
      board[[0, 4]] = black_king
      board[[7, 0]] = white_rook
      board[[5, 2]] = black_knight
    end

    it 'returns all pieces on the board' do
      expect(board.pieces).to contain_exactly(white_king, black_king, white_rook, black_knight)
    end

    it 'returns all white pieces on the board' do
      expect(board.pieces(:white)).to contain_exactly(white_king, white_rook)
    end

    it 'returns all black pieces on the board' do
      expect(board.pieces(:black)).to contain_exactly(black_king, black_knight)
    end
  end

  describe '#in_check?' do
    let(:board) { Board.new }
    let(:white_king) { King.new(board, [6, 6], :white) }
    let(:black_king) { King.new(board, [1, 1], :black) }
    let(:white_queen) { Queen.new(board, [2, 2], :white) }

    before do
      board[[6, 6]] = white_king
      board[[1, 1]] = black_king
      board[[2, 2]] = white_queen
    end

    it 'returns false when the king is not in check' do
      expect(board.in_check?(:white)).to be_falsey
    end

    it 'returns true when the king is in check' do
      expect(board.in_check?(:black)).to be_truthy
    end
  end

  describe '#checkmate?' do
    let(:board) { Board.new }
    let(:white_king) { King.new(board, [6, 6], :white) }
    let(:black_king) { King.new(board, [0, 0], :black) }
    let(:white_queen) { Queen.new(board, [2, 2], :white) }

    before do
      board[[6, 6]] = white_king
      board[[0, 0]] = black_king
      board[[2, 2]] = white_queen
    end

    it 'returns false when the king is not in checkmate' do
      expect(board.in_check?(:white)).to be_falsey
    end

    it 'returns true when the king is in checkmate' do
      expect(board.in_check?(:black)).to be_truthy
    end
  end
end
