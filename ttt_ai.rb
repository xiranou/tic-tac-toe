class TttAi
  attr_reader :mark, :board

  def initialize(game)
    @mark = game[:mark]
    @board = game[:board]
  end

  def free_spots
    [].tap do |spot_indexes|
      @board.grid.each_with_index do |spot, index|
        spot_indexes << index if spot == "_"
      end
    end
  end

  def mark_spot
    pick = free_spots.sample
    board.mark({index: pick, mark: mark})
  end
end