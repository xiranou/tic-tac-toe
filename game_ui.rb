module GameUi
  class << self
    def print_screen(board)
      clear_screen
      puts board.to_s
    end

    def clear_screen
      puts "\e[H\e[2J"
    end

    def player_input
      gets.chomp.downcase
    end

    def choose_mark(marks)
      puts "Please choose your turn: #{marks.join(" / ")}"
      choice = player_input
      if marks.include?(choice)
        choice_index = marks.index(choice)
      else
        puts "invalid choice! Choose again."
        choose_mark(marks)
      end
    end

    def player_move(message)
      puts message if message
      move_index = player_input.to_i
    end

    def again_prompt(message='Play Again? (y/n)')
      puts message
      choice = player_input
      ['y','n'].include?(choice) ? choice : again_prompt("invalid choice!")
    end

    def goodbye_prompt(message="Goodbye!")
      puts message
    end

    def annouce_winner(winner)
      puts "Draw Game!" if winner == 'draw'
      puts "#{winner.capitalize} is the winner!"
    end
  end
end