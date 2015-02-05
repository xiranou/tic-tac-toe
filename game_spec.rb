require 'rspec'
require './tic_tac_toe'
require './game_ai'
require './game'

describe "Game" do
  before do
    @game = Game.new
  end

  describe "should let player choose their marks" do
    before do
      @game.set_mark(0)
    end
    it "should return the player as 'x' mark" do
     expect(@game.player).to eq("x")
    end
    it "should return the computer as 'o' mark" do
      expect(@game.computer).to eq("o")
    end
  end
end