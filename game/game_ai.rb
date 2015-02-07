class GameAi
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def mark_spot(mark)
    pick = board.free_spots.sample
    board.mark(index: pick, mark: mark)
  end
end