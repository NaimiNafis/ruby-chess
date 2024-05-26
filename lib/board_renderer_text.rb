require_relative 'chess_pieces/chess_pieces'

class BoardRendererText

  attr_reader :board
  
  def initialize(board)
    @board = board
  end

  def render
    rows = @board.grid.each_with_index.map do |row, i|
      row_content = row.map { |cell| cell.nil? ? '.' : cell.to_s }.join(' | ')
      "#{4 - i} | #{row_content} | #{4 - i}"
    end

    # heredoc syntax ~, more readable multi-line string
    board_string = <<~BOARD
          a   b   c   d
        +---+---+---+---+
      #{rows.join("\n  +---+---+---+---+\n")}
        +---+---+---+---+
          a   b   c   d
    BOARD

    board_string
    

  end
end
