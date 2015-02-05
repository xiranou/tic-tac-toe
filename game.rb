require './tic_tac_toe'
require './game_ai'

class Game
  attr_reader :board, :player, :computer, :marks, :turn

  def initialize
    @board = TicTacToeBoard.new
    @marks = ["x","o"]
    @trun = []
  end

  def set_mark(choice)
    @player = marks.delete(choice)
    @computer = GameAi.new({board: board, mark: marks.last})
  end

  def winner
    turn.last == player ? "player" : "computer"
  end

  def play
    until @board.finish?
      return winner if @board.game_win?
      turn << player
      move = Ui.move
      @board.mark(move)
      turn << computer.mark
      @computer.mark_spot
    end
    return "Draw!"
    play if play_again?
    Ui.goodbye_prompt
  end

  def play_again?
    Ui.again_prompt == 0
  end
end