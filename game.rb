require './tic_tac_toe'
require './game_ai'
require './game_ui'

class Game
  attr_reader :board, :player, :computer, :ai, :marks, :turn

  def initialize
    @board = TicTacToeBoard.new
    @ai = GameAi.new(board)
    @marks = ["x","o"]
    @turn = []
  end

  def set_mark(choice)
    marks.each_with_index do |mark, index|
      index == choice ? @player = mark : @computer = mark
    end
  end

  def winner
    turn.last == player ? "player" : "computer"
  end

  def player_turn
    move = {index: GameUi.player_move, mark: player}
    board.mark(move)
    turn << player
  end

  def ai_turn
    ai.mark_spot(computer)
    turn << computer
  end

  def game_turn(current_turn)
    current_turn == player ? player_turn : ai_turn
  end

  def player_choose_mark
    player_choice = GameUi.choose_mark(marks)
    set_mark(player_choice)
  end

  def game_round
    marks.cycle do |current_turn|
      game_turn(current_turn)
      GameUi.print_screen(board)
      return GameUi.annouce_winner(winner) if board.game_win?
    end
  end

  def play
    player_choose_mark
    GameUi.print_screen(board)

    game_round unless board.finish?

    GameUi.annouce_winner("draw") unless board.game_win?

    play_again? ? reset_game : GameUi.goodbye_prompt
  end

  def reset_game
    self.board = TicTacToeBoard.new
    self.ai = GameAi.new(board)
    play
  end

  def play_again?
    GameUi.again_prompt == 'y'
  end

  private

  attr_writer :board, :ai
end

game = Game.new
game.play