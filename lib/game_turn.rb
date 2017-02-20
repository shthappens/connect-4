
class GameTurn

  attr_reader :board
  attr_reader :player
  attr_reader :row_index
  attr_reader :col_index
  attr_reader :character

  def initialize(board, player, row_index, col_index)
    @board = board
    @player = player
    @row_index = row_index
    @col_index = col_index
  end

  def column_full?
    @board.rows[@row_index][@col_index].occupied?
  end

  def take!
    @board.rows[@row_index][@col_index].player = @player
  end

  def winner?
    horizontal_win? || vertical_win?
  end

  def horizontal_win?
    4.times do |n|
      if check_row(@board.rows[@row_index][n..n + 3])
        return true
      end
    end
    return false
  end

  def vertical_win?
    4.times do |n|
      if check_column(@board.rows[n..n + 3])
        return true
      end
    end
    return false
  end

  def check_row(array)
    victory = false
    characters = []
    array.each do |space|
      if !space.nil?
        characters << space.player
      end
    end
    if characters.count >= 4 && characters.uniq.length == 1 && characters.first != nil
      victory = true
    end
    victory
  end

  def check_column(array)
    victory = false
    characters = []
    array.each do |space|
      if !space[@col_index].nil?
        characters << space[@col_index].player
      end
    end
    if characters.count >= 4 && characters.uniq.length == 1 && characters.first != nil
      victory = true
    end
    victory
  end

end
