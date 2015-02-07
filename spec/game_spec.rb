require 'rspec'
require './game/tic_tac_toe'
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
  end

end