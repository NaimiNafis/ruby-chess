# frozen_string_literal: true

require_relative '../lib/pieces/queen'
require_relative '../lib/pieces/piece'
require_relative '../lib/board'

describe Queen do
  describe 'to_s' do
    it 'return queen emoji ♕ if :black' do
      queen = Queen.new(self, [0, 3], :black)
      expect(queen.to_s).to eql('♕')
    end

    it 'return queen emoji ♛ if :white' do
      queen = Queen.new(self, [7, 3], :white)
      expect(queen.to_s).to eql('♛')
    end
  end
end
