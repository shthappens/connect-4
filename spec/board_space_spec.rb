require 'spec_helper'

describe BoardSpace do
  it "is occupied if a player has played there" do
    space = BoardSpace.new
    space.player = Player.new("Seth", "X")
    expect(space).to be_occupied
  end
  it "is not occupied if a player has not played there" do
    space = BoardSpace.new
    expect(space.occupied?).to be(false)
    expect(space).to_not be_occupied
  end

  it "has a player if one is assigned to it" do
    player = Player.new("Seth", "X")
    space = BoardSpace.new
    space.player = player
    expect(space.player).to eq(player)
  end

  it "represents the player occupying it as a string" do
    player = Player.new("Seth", "X")
    space = BoardSpace.new
    space.player = player
    expect(space.to_char).to eq("X")
  end

  it "represents an empty space if it is empty as a string" do
    space = BoardSpace.new
    expect(space.to_char).to eq(" ")
  end

end
