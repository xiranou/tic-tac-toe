require './tic_tac_toe'
module GameUi
  class << self
    def print_screen(board)
      grid, size = board.grid, board.size
      grid.each_slice(size) {|row| puts row.join(" | ")}
    end
    def player_input
      gets.chomp.downcase
    end
    def choose_mark(marks)
      puts "Please choose your turn: #{marks.join(" / ")}"
      choice = player_input
      if marks.include?(choice)
        choice
      else
        puts "invalid choice! Choose again."
        choose_mark(marks)
      end
    end
    def player_move(player)
      idx = player_input.to_i
      move={index: idx, mark: player}
    end
    def again_prompt(message='Play Again? (y/n)')
      puts message
      choice = player_input
      ['y','n'].include?(choice) ? choice : again_prompt("invalid choice!")
    end
    def annouce_winner(winner)
      puts "Draw Game!" if winner == 'draw'
      puts "#{winner.capitalize} is the winner!"
    end
  end
end