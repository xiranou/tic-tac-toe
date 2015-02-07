require 'rspec'
require './game/board'

describe Board do
  def mark_spots(spot_indexes, mark="x")
    spot_indexes.each do |idx|
      @board.mark(index: idx, mark: mark)
    end
  end

  def emulate_game(chosen_spots, mark="x")
    mark_spots(chosen_spots)
    free_spots = get_free_spots(chosen_spots)
    mark_spots(free_spots,'o')
  end

  def get_free_spots(occupied)
    [*0...@board.grid_size].reject do |idx|
      occupied.include?(idx)
    end
  end

  before :each do
    @board = Board.new
  end

  it "should initialize with a default 3x3 grid" do
    expect(@board.grid.size).to eq(9)
  end

  describe "mark" do
    it "should mark the given spot with the given mark" do
      @board.mark(index: 0, mark: 'x')
      expect(@board.grid[0]).to eq("x")
    end
  end

  describe "rows" do
    it "should return all the starting indexes of rows in board" do
      expect(@board.rows).to match_array([0,3,6])
    end
  end

  describe "win pattern row" do
    it "should return true if a row has the same marks" do
      mark_spots([*0..2])
      expect(@board.win_pattern_met?(:row)).to be true
    end

    it "should return false if no row has the same marks" do
      mark_spots([1,4,5])
      expect(@board.win_pattern_met?(:row)).to be false
    end
  end

  describe "columns" do
    it "should return all starting indexes of columns in board" do
      expect(@board.columns).to match_array([0,1,2])
    end
  end

  describe "win_pattern_met?(:column)" do
    it "should return true if a column contains the same marks" do
      mark_spots([0,3,6])
      expect(@board.win_pattern_met?(:column)).to be true
    end

    it "should return false if no column has the same marks" do
     mark_spots([1,4,5])
      expect(@board.win_pattern_met?(:column)).to be false
    end
  end

  describe "diagonals" do
    it "should return all starting indexes of diagonals in board" do
      expect(@board.diagonals).to match_array([0,2])
    end
  end

  describe "win_pattern_met?(:diagonal)" do
    it "should return true if a diagonal contains the same marks" do
      mark_spots([0,4,8])
      expect(@board.win_pattern_met?(:diagonal)).to be true
    end

    it "should return true if the other diagonal contains the same marks" do
      mark_spots([2,4,6], "o")
      expect(@board.win_pattern_met?(:diagonal)).to be true
    end

    it "should return false if no diagonal has the same marks" do
     mark_spots([1,4,5])
      expect(@board.win_pattern_met?(:diagonal)).to be false
    end
  end

  describe "game win" do
    context "should return true if any one of the win condition returns true" do
      it "should return true when there's a horizontal_win in game" do
        emulate_game([0,1,2,4,6])
        expect(@board.game_win?).to be true
      end

      it "should return true when there's a vertical_win in game" do
        emulate_game([1,4,7,0,8])
        expect(@board.game_win?).to be true
      end

      it "should return true when there's a diagonal_win in game" do
        emulate_game([0,4,8,1,5])
        expect(@board.game_win?).to be true
      end

      it "should return true for other mark gets win" do
        emulate_game([0,4,8,1,5], "o")
        expect(@board.game_win?).to be true
      end
    end
    context "should return false when no winning condition is met" do
      it "should return false for a draw game" do
        emulate_game([0,2,4,7])
        expect(@board.game_win?).to be false
      end
    end
  end

  describe "finish" do
    it "should return true when no empty spots remain" do
      emulate_game([0,2,4,7])
      expect(@board.finish?).to be true
    end
    it "should return false when there are still empty spots remain" do
      mark_spots([1,3,5,7])
      expect(@board.finish?).to be false
    end
  end

end