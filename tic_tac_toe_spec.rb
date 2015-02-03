require 'rspec'
require_relative './tic_tac_toe.rb'

describe TicTacToeBoard do

  before :each do
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

  describe "rows" do
    it "should return all the starting indexes of rows in board" do
      expect(@board.rows).to eq [0,3,6]
    end
  end

  describe "horizontal win" do
    it "should return true if a row has the same marks" do
      [*0..2].each do |idx|
        @board.mark({index:idx, mark: 'x'})
      end
      expect(@board.horizontal_win?).to be true
    end

    it "should return false if no row has the same marks" do
      ["x", "o"].each_with_index do |mark, idx|
        @board.mark({index: idx, mark: mark})
      end
      expect(@board.horizontal_win?).to be false
    end
  end

end