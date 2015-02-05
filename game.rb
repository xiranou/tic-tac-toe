require './tic_tac_toe'
require './game_ai'

class Game
  attr_reader :board, :player, :computer, :marks, :turn

  def initialize
    @board = TicTacToeBoard.new
    @marks = ["x","o"]
    @turn = []
  end

  def set_mark(choice)
    @player = marks.delete(choice)
    @computer = GameAi.new(board: board, mark: marks.last)
  end

  def winner
    turn.last == player ? "player" : "computer"
  end

  def game_turn(player_move)
    turn << player << computer.mark
    board.mark(player_move)
    computer.mark_spot
  end

  def play
    # set_marks(Ui.player_mark)
    until @board.finish?
      return winner if @board.game_win?
      # game_turn(Ui.player_move)
    end
    return "Draw!"
    # play if play_again?
  end

  # def play_again?
  #   Ui.again_prompt == 0
  # end
end