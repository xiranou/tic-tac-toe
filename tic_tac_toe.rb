require 'debugger'
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

  def get_row(row_head)
    grid[row_head...(row_head + size)]
  end

  def horizontal_win?
    rows.each do |row_head|
      return true if matched?(get_row(row_head))
    end
    return false
  end

  def columns
    [*0...size]
  end

  def get_column(column_head)
    [].tap do |column|
      [*column_head...grid_size].map do |idx|
        column << grid[idx] if idx % 3 == column_head
      end
    end
  end

  def vertical_win?
    columns.each do |column_head|
      return true if matched?(get_column(column_head))
    end
    return false
  end

  def diagonals
    [0, (size-1)]
  end

  def matched?(target_array)
    return false if target_array.include?("_")
    target_array.uniq.length == 1
  end

end