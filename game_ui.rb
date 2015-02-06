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
  end
end

board = TicTacToeBoard.new
GameUi.print_screen(board)
# GameUi.choose_mark(["x","o"])
GameUi.player_move("x")