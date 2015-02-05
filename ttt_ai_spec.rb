require 'rspec'
require './ttt_ai'
require './tic_tac_toe'

describe "TttAi" do
  before do
    board = TicTacToeBoard.new
    @computer = TttAi.new({grid: board.grid, mark: "o"})
  end

  describe "#free_spots" do
    it "should return array of indexes of free spots on board grid" do
      expect(@computer.free_spots).to match_array([*0..8])
    end
  end
end