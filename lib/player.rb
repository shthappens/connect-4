class Player

  attr_reader :character
  attr_reader :name

  def initialize(name, character)
    @name = name
    @character = character
  end

end
