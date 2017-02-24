require "spec_helper"

describe Player do
  it "has an X character" do
    player = Player.new("Seth", "X")
    expect(player.character).to eq("X")
  end

  it "has an O character" do
    player = Player.new("Sam", "O")
    expect(player.character).to eq("O")
  end
end
