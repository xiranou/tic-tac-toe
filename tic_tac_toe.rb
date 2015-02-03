class TicTacToeBoard

  attr_reader :grid, :size, :grid_size

  def initialize(size=3)
    @size = size
    @grid_size = size * size
    @grid = Array.new(grid_size) { |spot| "_" }
  end

  def mark(move)
    grid[move[:index]] = move[:mark]
  end

  def horizontal_win?

  end

end