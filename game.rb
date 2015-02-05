require './tic_tac_toe'
require './game_ai'

class Game
  attr_reader :board, :player, :computer, :marks

  def initialize
    @board = TicTacToeBoard.new
    @marks = ["x","o"]
  end

  def set_mark(choice)
    @player = marks.delete(choice)
    @computer = GameAi.new({board: board, mark: marks.last})
  end
end