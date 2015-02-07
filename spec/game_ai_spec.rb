require 'rspec'
require './game/game_ai'
require './game/tic_tac_toe'

describe "GameAi" do
  before do
    @board = TicTacToeBoard.new
    @computer = GameAi.new(@board)
  end

  describe "#mark_spot" do
    before do
      @computer.mark_spot('o')
    end
    it "should mark to an empty spot" do
      expect(@board.grid.include?("o")).to be true
    end
    it "should only mark once" do
      expect(@board.grid.count("o")).to eq(1)
    end
  end
end