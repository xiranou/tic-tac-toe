require 'rspec'
require './tic_tac_toe'

describe TicTacToeBoard do
  def mark_spots(spot_indexes, mark="x")
    spot_indexes.each do |idx|
      @board.mark({index: idx, mark: mark})
    end
  end

  def emulate_game(winning_spots, mark="x")
    mark_spots(winning_spots)
    free_spots = get_free_spots(winning_spots)
    mark_spots(free_spots, "o")
  end

  def get_free_spots(occupied)
    [*0...@board.grid_size].reject do |idx|
      occupied.include?(idx)
    end
  end

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
      mark_spots([*0..2])
      expect(@board.horizontal_win?).to be true
    end

    it "should return false if no row has the same marks" do
      mark_spots([1,4,5])
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
      mark_spots([0,3,6])
      expect(@board.vertical_win?).to be true
    end

    it "should return false if no column has the same marks" do
     mark_spots([1,4,5])
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
      mark_spots([0,4,8])
      expect(@board.diagonal_win?).to be true
    end

    it "should return true if the other diagonal contains the same marks" do
      mark_spots([2,4,6], "o")
      expect(@board.diagonal_win?).to be true
    end

    it "should return false if no diagonal has the same marks" do
     mark_spots([1,4,5])
      expect(@board.diagonal_win?).to be false
    end
  end

  describe "game win" do
    context "should return true if any one of the win condition returns true" do
      it "should return true when there's a horizontal_win in game" do
        emulate_game([0,1,2])
        expect(@board.game_win?).to be true
      end

      it "should return true when there's a vertical_win in game" do
        emulate_game([1,4,7])
        expect(@board.game_win?).to be true
      end

      it "should return true when there's a diagonal_win in game" do
        emulate_game([0,4,8])
        expect(@board.game_win?).to be true
      end

      it "should return true for other mark gets win" do
        emulate_game([0,4,8], "o")
        expect(@board.game_win?).to be true
      end
    end
  end

end