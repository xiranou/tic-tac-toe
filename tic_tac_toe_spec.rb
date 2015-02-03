require 'rspec'
require_relative './tic_tac_toe.rb'

describe "TicTacToeBoard" do
  it "should initialize with a default 3x3 grid" do
    board = TicTacToeBoard.new
    expect(board.grid.size).to eq(9)
  end
end