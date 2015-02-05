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
    end
  end

  def horizontal_win?
    rows.each do |row_head|
      return true if matched?(grid[row_head...row_head+size])
    end
    return false
  end

  def columns
    [*0...size]
  end

  def matched?(target_array)
    return false if target_array.include?("_")
    target_array.uniq.length == 1
  end

end