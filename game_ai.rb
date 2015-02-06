class GameAi
  attr_reader :mark, :board

  def initialize(game={})
    @mark = game[:mark]
    @board = game[:board]
  end

  def mark_spot(mark)
    pick = board.free_spots.sample
    board.mark(index: pick, mark: mark)
  end
end