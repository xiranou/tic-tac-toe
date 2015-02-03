class TicTacToeBoard
  attr_reader :grid

  def initialize(size=3)
    @grid = Array.new(size*size) { |quad| "_" }
  end
end