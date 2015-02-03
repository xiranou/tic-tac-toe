class TicTacToeBoard
  attr_reader :grid

  def initialize(size=9)
    @grid = Array.new(size) { |quad| "_" }
  end
end