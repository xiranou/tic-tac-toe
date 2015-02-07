class Board
  attr_reader :grid, :size, :grid_size

  def initialize(size=3)
    @size = size
    @grid_size = size * size
    @grid = Array.new(grid_size) { |spot| "_" }
  end

  def mark(move={})
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
        column << grid[idx] if idx % size == column_head
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

  def get_diagonal(diagonal_head)
    diagonal_head == 0 ? direction = (size + 1) : direction = (size - 1)
    current_point = diagonal_head
    get_diagonal_values(current_point, direction)
  end

  def get_diagonal_values(current_point, direction)
    [].tap do |diagonal|
      size.times do |_|
        diagonal << grid[current_point]
        current_point += direction
      end
    end
  end

  def diagonal_win?
    diagonals.each do |diagonal_head|
      return true if matched?(get_diagonal(diagonal_head))
    end
    return false
  end

  def matched?(target_array)
    return false if target_array.include?("_")
    target_array.uniq.length == 1
  end

  def game_win?
    horizontal_win? || vertical_win? || diagonal_win?
  end

  def finish?
    !grid.include?("_")
  end

  def free_spots
    [].tap do |spot_indexes|
      grid.each_with_index do |spot, index|
        spot_indexes << index if spot == "_"
      end
    end
  end

  def generate_index_grid
    [].tap do |index_grid|
      grid.each_with_index do |value, index|
        value == '_' ? index_grid << " #{index} " : index_grid << "(#{value.upcase})"
      end
    end
  end

  def to_s
    idx_grid = generate_index_grid
    [].tap do |box|
      idx_grid.each_slice(size) do |row|
        box << row.join(" | ")
      end
    end.join("\n")
  end
end