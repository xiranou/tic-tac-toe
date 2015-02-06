require './tic_tac_toe'
require './game_ai'
require './game_ui'

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
    player_choice = GameUi.choose_mark(marks)
    set_mark(player_choice)
    until @board.finish?
      GameUi.print_screen(board)
      return GameUi.annouce_winner(winner) if board.game_win?
      game_turn(GameUi.player_move(player))
    end
    return "Draw!"
    play if play_again?
  end

  def play_again?
    GameUi.again_prompt == 'y'
  end
end

game = Game.new
game.play