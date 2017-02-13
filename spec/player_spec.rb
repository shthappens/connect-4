require "spec_helper"

require_relative "../lib/player"
describe Player do
  it "has an X character" do
    player = Player.new("X")
    expect(player.character).to eq("X")
  end

  it "has an O character" do
    player = Player.new("O")
    expect(player.character).to eq("O")
  end
end
