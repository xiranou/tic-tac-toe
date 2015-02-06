require 'rspec'
require_relative '../tic_tac_toe'
require_relative '../game_ai'
require_relative '../game_ui'
require_relative '../game'

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