require 'spec_helper'

require_relative "../lib/board"

describe Board do
  it "can be initialized by 10 rows and 10 columns by default" do
    board = Board.new
    expect(board.rows.size).to eq(10)
    expect(board.rows[0].size).to eq(10)
  end

  it "prints rows and columns for the board" do
    board = Board.new(10)
    board_printout =
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      " A B C D E F G H I J "

    expect(board.print).to eq(board_printout)
  end

  it "places a player on the board" do
    board = Board.new
    board.add_turn("X", 9, 0)

    board_printout =
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|X                  |\n" +
      " A B C D E F G H I J "
    expect(board.print).to eq(board_printout)
  end

  it "places a player in the center of the bottom row" do
    board = Board.new
    board.add_turn("O", 9, 4)

    board_printout =
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|                   |\n" +
      "|        O          |\n" +
      " A B C D E F G H I J "
    expect(board.print).to eq(board_printout)
  end

  it "has empty spaces when initiated" do
    board = Board.new
    expect(board.empty_spaces?).to eq(true)
  end

  it "has no empty spaces when the game is completely occupied" do
    board = Board.new
    10.times do |index|
      10.times do |col_index|
        board.add_turn("X", index, col_index)
      end
    end
    expect(board.empty_spaces?).to eq(false)
  end

end
