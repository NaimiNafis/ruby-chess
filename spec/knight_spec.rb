# frozen_string_literal: true

require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/piece'
require_relative '../lib/board'

describe Knight do
  describe 'to_s' do
    it 'return knight emoji ♘ if :black' do
      knight = Knight.new(self, [0, 1], :black)
      expect(knight.to_s).to eql('♘')
    end

    it 'return knight emoji ♞ if :white' do
      knight = Knight.new(self, [7, 1], :white)
      expect(knight.to_s).to eql('♞')
    end
  end
end
