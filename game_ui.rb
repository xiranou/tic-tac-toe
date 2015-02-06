require './tic_tac_toe'
module GameUi
  class << self
    def print_screen(board)
      grid, size = board.grid, board.size
      grid.each_slice(size) {|row| puts row.join(" | ")}
    end
  end
end

board = TicTacToeBoard.new
GameUi.print_screen(board)