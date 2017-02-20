require 'spec_helper'

describe GameTurn do
  let(:board) { Board.new }
  let(:player) { Player.new("X") }
  let(:opposing_player) { Player.new("O") }
  let(:row_index) { 0 }
  let(:col_index) { 0 }
  let(:turn) { GameTurn.new(board, player, row_index, col_index) }

  it "has a board" do
    expect(turn.board).to eq(board)
  end

  it "has a player" do
    expect(turn.player).to eq(player)
  end

  it "has a row index" do
    expect(turn.row_index).to eq(row_index)
  end

  it "has a col index" do
    expect(turn.col_index).to eq(col_index)
  end

  context "checking for win conditions" do
    context "horizontally" do
      it "does have a win if a player occupies 4 spaces on the same row consecutively" do
        winning_board = Board.new
        3.times do |index|
          winning_board.add_turn(player, 6, index)
        end

        winning_turn = GameTurn.new(winning_board, player, 6, 3)
        winning_turn.take!
        expect(winning_turn).to be_winner
      end

      it "does not have a win if a row is interrupted by another player" do
        losing_board = Board.new
        losing_board.add_turn(opposing_player, 6, 0)
        losing_board.add_turn(opposing_player, 6, 1)
        losing_board.add_turn(opposing_player, 6, 2)

        losing_turn = GameTurn.new(losing_board, player, 6, 3)
        losing_turn.take!
        expect(losing_turn).to_not be_winner
      end
    end

    context "vertically" do
      it "does have a win if a player occupies 4 spaces on the same column consecutively" do
        winning_board = Board.new
        3.times do |index|
          winning_board.add_turn(player, index, 0)
        end

        winning_turn = GameTurn.new(winning_board, player, 3, 0)
        winning_turn.take!
        expect(winning_turn).to be_winner
       end

      it "does not have a win if a column is interrupted by another player" do
        losing_board = Board.new
        losing_board.add_turn(opposing_player, 6, 0)
        losing_board.add_turn(opposing_player, 5, 0)
        losing_board.add_turn(opposing_player, 4, 0)

        losing_turn = GameTurn.new(losing_board, player, 3, 0)
        losing_turn.take!
        expect(losing_turn).to_not be_winner
      end
    end
  end

  context "checking column spaces" do
    context "check if a column is full" do
      it "checks if a column is full and returns true" do
        full_column = Board.new
        full_column.add_turn(player, 6, 0)
        full_column.add_turn(opposing_player, 5, 0)
        full_column.add_turn(player, 4, 0)
        full_column.add_turn(opposing_player, 3, 0)
        full_column.add_turn(player, 2, 0)
        full_column.add_turn(opposing_player, 1, 0)
        full_column.add_turn(player, 0, 0)

        full_column_turn = GameTurn.new(full_column, opposing_player, 0, 0)
        full_column_turn.take!
        expect(full_column_turn).to be_column_full
      end
    end
  end
end
