module GameUi
  class << self
    def print_screen(board)
      clear_screen
      puts "Enter the correspoding number to play"
      puts board
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
        puts "No such mark, choose again."
        choose_mark(marks)
      end
    end

    def player_move(message=nil)
      puts message if message
      move_index = player_input.to_i
    end

    def again_prompt(message='Play Again? (y/n)')
      puts message
      choice = player_input
      ['y','n'].include?(choice) ? choice : again_prompt("Unrecongize option #{choice}, please confirm.")
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