require './tic_tac_toe'
require './game_ai'
require './game_ui'

class Game
  attr_accessor :board, :player, :computer
  attr_reader :marks, :ai, :turn

  def initialize
    @board = TicTacToeBoard.new
    @marks = ["x","o"]
    @turn = []
    @ai = GameAi.new(board)
  end

  def set_mark(choice)
    marks.each_with_index do |mark, index|
      index == choice ? @player = mark : @computer = mark
    end
  end

  def winner
    turn.last == player ? "player" : "computer"
  end

  def game_turn(current_turn)
    if current_turn == player
      move = {index: GameUi.player_move, mark: player}
      board.mark(move)
      turn << player
    else
      ai.mark_spot(computer)
      turn << computer
    end
  end

  def play
    player_choice = GameUi.choose_mark(marks)
    set_mark(player_choice)
    GameUi.print_screen(board)
    until @board.finish?
      marks.cycle do |current_turn|
        game_turn(current_turn)
        GameUi.print_screen(board)
        if board.game_win?
          GameUi.annouce_winner(winner)
          play_again? ? play : return
        end
      end
    end
    GameUi.annouce_winner("draw")
    play if play_again?
  end

  def play_again?
    GameUi.again_prompt == 'y'
  end
end

game = Game.new
game.play