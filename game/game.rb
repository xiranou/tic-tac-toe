class Game
  attr_reader :board, :player, :computer, :ai, :marks, :turn

  def initialize
    @board = Board.new
    @ai = GameAi.new(board)
    @marks = ["x","o"]
    @turn = [] # keep tracks of turn
  end

  def set_mark(choice)
    marks.each_with_index do |mark, index|
      index == choice ? @player = mark : @computer = mark
    end
  end

  def winner # the last mark saved in turn and game_win? returns true should be the winner.
    turn.last == player ? "player" : "computer"
  end

  def player_turn(message=nil)
    move = {index: GameUi.player_move(message), mark: player}
    valid_move?(move[:index]) ? board.mark(move) : player_turn("Invalid move! Pick another!")
    turn << player
  end

  def valid_move?(index)
    board.free_spots.include?(index)
  end

  def ai_turn
    ai.mark_spot(computer)
    turn << computer
  end

  def game_turn(current_turn) # determins who goes at the current_turn base on the mark they choose
    current_turn == player ? player_turn : ai_turn
  end

  def player_choose_mark
    player_choice = GameUi.choose_mark(marks)
    set_mark(player_choice)
  end

  def set_game
    player_choose_mark
    GameUi.print_screen(board)
  end

  def game_round # play each turn according to 'X' first then 'O', if there's a winner in the current turn, stop and annouce winner
    marks.cycle do |current_turn|
      game_turn(current_turn) # pass current_turn to game_turn to determins whose turn is it
      GameUi.print_screen(board)
      return GameUi.annouce_winner(winner) if board.game_win?
    end
  end

  def play
    set_game # star of game, let player choose mark
    game_round unless board.finish? # process to each round unless board.finish?
    GameUi.annouce_winner("draw") unless board.game_win? # annouce draw game unless there's a winner
    if play_again? # prompt for repeat game
      reset_game
      play
    else
      GameUi.goodbye_prompt
    end
  end

  def reset_game
    self.board = Board.new
    self.ai = GameAi.new(board)
  end

  def play_again?
    GameUi.again_prompt == 'y'
  end

  alias :do_magic :play

  private

  attr_writer :board, :ai
end