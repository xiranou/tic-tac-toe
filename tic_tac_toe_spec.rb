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
      expect(@board.rows).to match_array([0,3,6])
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

  describe "columns" do
    it "should return all starting indexes of columns in board" do
      expect(@board.columns).to match_array([0,1,2])
    end
  end

  describe "vertical win" do
    it "should return true if a column contains the same marks" do
      [0,3,6].each do |idx|
        @board.mark({index: idx, mark: "x"})
      end
      expect(@board.vertical_win?).to be true
    end

    it "should return false if no column has the same marks" do
      ["x", "o"].each_with_index do |mark, idx|
        @board.mark({index: idx, mark: mark})
      end
      expect(@board.vertical_win?).to be false
    end
  end

  describe "diagonals" do
    it "should return all starting indexes of diagonals in board" do
      expect(@board.diagonals).to match_array([0,2])
    end
  end

  describe "diagonal win" do
    it "should return true if a diagonal contains the same marks" do
      [0,4,8].each do |idx|
        @board.mark({index: idx, mark: "x"})
      end
      expect(@board.diagonal_win?).to be true
    end

    it "should return true if the other diagonal contains the same marks" do
      [2,4,6].each do |idx|
        @board.mark({index: idx, mark: "x"})
      end
      expect(@board.diagonal_win?).to be true
    end

    it "should return false if no diagonal has the same marks" do
      ["x", "o"].each_with_index do |mark, idx|
        @board.mark({index: idx, mark: mark})
      end
      expect(@board.diagonal_win?).to be false
    end
  end

end