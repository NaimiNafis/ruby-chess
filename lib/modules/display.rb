# frozen_string_literal: true

module Display
    def self.clear_screen
      system('cls') || system('clear')
    end
  
    def self.render_board(board)
      clear_screen
      size = board.grid.size
      column_labels = ('a'..'z').first(size).join('   ')
      border = "+---" * size + "+"
  
      rows = board.grid.each_with_index.map do |row, i|
        row_content = row.map { |cell| cell.nil? ? ' ' : cell.to_s }.join(' | ')
        "#{size - i} | #{row_content} | #{size - i}"
      end
  
      board_string = <<~BOARD
        #{'    ' if size < 10}#{column_labels}
        #{'  ' if size < 10}#{border}
        #{rows.join("\n#{'  ' if size < 10}#{border}\n")}
        #{'  ' if size < 10}#{border}
        #{'    ' if size < 10}#{column_labels}
      BOARD
  
      puts board_string
    end
  
  end
  