require 'rspec'
require './tic_tac_toe'
require './game_ai'
require './game'

describe "Game" do
  before :each do
    @game = Game.new
  end

  describe "should let player choose their marks" do
    before do
      @game.set_mark("x")
    end
    it "should return the player as 'x' mark" do
     expect(@game.player).to eq("x")
    end
    it "should return the computer as 'o' mark" do
      expect(@game.computer.mark).to eq("o")
    end
  end

  describe "turn" do
    before do
      player_move = {index:0, mark:"x"}
      @game.game_turn(player_move)
      @current_grid = @game.board.gird
    end
    context 'should alternate turns' do
      it "should have one player mark" do
        expect(@current_grid.find_all{|mark| mark == "x"}.count).to eq(1)
      end
      it "should have one computer mark" do
        expect(@current_grid.find_all{|mark| mark == "o"}.count).to eq(1)
      end
    end
    it "should keep track of turns" do
      expect(@game.turn).to match_array(['x','o'])
    end
  end
end