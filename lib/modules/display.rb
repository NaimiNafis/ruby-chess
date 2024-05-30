# frozen_string_literal: true

module Display
    
    def self.main_menu
        clear_screen
        chess_icon = <<~ICON
        ██████╗██╗  ██╗███████╗███████╗███████╗
        ██╔════╝██║  ██║██╔════╝██╔════╝██╔════╝
        ██║     ███████║█████╗  ███████╗███████╗
        ██║     ██╔══██║██╔══╝  ╚════██║╚════██║
        ╚██████╗██║  ██║███████╗███████║███████║
         ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝        
        ICON
        puts chess_icon
        puts "Welcome to My Chess Game!"
        puts "1. Start New Game"
        puts "2. Load Game"
        puts "3. Exit"
        print "Choose an option: "
        gets.chomp.to_i
    end

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
  