require 'rspec'
require_relative './tic_tac_toe.rb'

describe TicTacToeBoard do

  before do
    @board = TicTacToeBoard.new
  end
  it "should initialize with a default 3x3 grid" do
    expect(@board.grid.size).to eq(9)
  end

  describe "mark" do
    it "should mark the given spot with the given mark" do
      move = {index: 0, mark: 'x'}
      @board.mark(move)
      expect(@board.grid[0]).to eq("x")
    end
  end

end