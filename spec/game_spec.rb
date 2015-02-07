require 'rspec'
require './game/board'
require './game/game_ai'
require './game/game_ui'
require './game/game'

describe "Game" do

  describe "should let player choose their marks" do
    before do
      @game = Game.new
      @game.set_mark(0)
    end
    it "should set player to 'x'" do
      expect(@game.player).to eq('x')
    end
    it "should set computer to 'o'" do
      expect(@game.computer).to eq('o')
    end
    it "should let player take the 'o' mark" do
      @game.set_mark(1)
      expect(@game.player).to eq('o')
    end
  end

  describe "valid_move?" do
    before do
      @game = Game.new
      @game.board.mark(index: 0, mark: "x")
    end
    it "should return false when player pick a marked spot" do
      expect(@game.valid_move?(0)).to be false
    end
    it "should return true when player pick an empty spot" do
      expect(@game.valid_move?(1)).to be true
    end
  end

end