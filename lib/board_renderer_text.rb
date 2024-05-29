require_relative 'pieces'

class BoardRendererText

  attr_accessor :board
  
  def initialize(board)
    @board = board
  end

  def render
    clear_screen
    size = board.grid.size
    column_labels = ('a'..'z').first(size).join('   ')
    border = "+---" * size + "+"

    rows = board.grid.each_with_index.map do |row, i|
      row_content = row.map { |cell| cell.nil? ? ' ' : cell.to_s }.join(' | ')
      "#{size - i} | #{row_content} | #{size - i}"
    end

    # heredoc syntax ~, more readable multi-line string
    board_string = <<~BOARD
      #{'    ' if size < 10}#{column_labels}
      #{'  ' if size < 10}#{border}
      #{rows.join("\n#{'  ' if size < 10}#{border}\n")}
      #{'  ' if size < 10}#{border}
      #{'    ' if size < 10}#{column_labels}
    BOARD

    puts board_string
  end

  def clear_screen
    system('cls') || system('clear')
  end
end
