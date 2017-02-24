require 'spec_helper'

describe Board do
  it "can be initialized by 10 rows and 10 columns by default" do
    board = Board.new
    expect(board.rows.size).to eq(7)
    expect(board.rows[0].size).to eq(7)
  end

  it "prints rows and columns for the board" do
    board = Board.new(7)
    board_printout =
      "|             |\n" +
      "|             |\n" +
      "|             |\n" +
      "|             |\n" +
      "|             |\n" +
      "|             |\n" +
      "|             |\n" +
      " A B C D E F G "

    expect(board.print).to eq(board_printout)
  end

  it "places a player on the board" do
    board = Board.new
    player = Player.new("Seth", "X")
    board.add_turn(player, 6, 0)

    board_printout =
      "|             |\n" +
      "|             |\n" +
      "|             |\n" +
      "|             |\n" +
      "|             |\n" +
      "|             |\n" +
      "|X            |\n" +
      " A B C D E F G "
    expect(board.print).to eq(board_printout)
  end

  it "places a player in the center of the bottom row" do
    board = Board.new
    player = Player.new("Sam", "O")
    board.add_turn(player, 6, 3)

    board_printout =
      "|             |\n" +
      "|             |\n" +
      "|             |\n" +
      "|             |\n" +
      "|             |\n" +
      "|             |\n" +
      "|      O      |\n" +
      " A B C D E F G "

    expect(board.print).to eq(board_printout)
  end

  it "has empty spaces when initiated" do
    board = Board.new
    expect(board.empty_spaces?).to eq(true)
  end

  it "has no empty spaces when the game is completely occupied" do
    board = Board.new
    player = Player.new("Seth", "X")
    7.times do |index|
      7.times do |col_index|
        board.add_turn(player, index, col_index)
      end
    end
    expect(board.empty_spaces?).to eq(false)
  end

end
