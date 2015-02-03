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

  def rows
    [].tap do |rows|
      (grid_size - 1).downto(0) do |index|
        rows << index if index % size == 0
      end
    end.sort
  end

  def horizontal_win?

  end

end