class TicTacToeBoard

  attr_reader :grid, :size

  def initialize(size=3)
    @size = size
    @grid = Array.new(size*size) { |spot| "_" }
  end

  def mark(move)
    grid[move[:index]] = move[:mark]
  end

end