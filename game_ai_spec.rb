require 'rspec'
require './game_ai'
require './tic_tac_toe'

describe "GameAi" do
  before do
    @board = TicTacToeBoard.new
    @computer = GameAi.new({board: @board, mark: "o"})
  end

  describe "#free_spots" do
    it "should return array of indexes of free spots on board grid" do
      expect(@computer.free_spots).to match_array([*0..8])
    end
  end

  describe "#mark_spot" do
    before do
      @computer.mark_spot
    end
    it "should mark to an empty spot" do
      expect(@board.grid.include?("o")).to be true
    end
    it "should only mark once" do
      expect(@board.grid.count("o")).to eq(1)
    end
  end
end