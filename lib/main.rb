
require_relative "board"
require_relative "player"
require_relative "board_space"
require_relative "game_turn"

puts "Welcome to Connect 4!"

puts "Player X, what is your name?"
player_1 = gets.chomp
puts "Player O, what is your name?"
player_2 = gets.chomp

x_player = Player.new(player_1, "X")
o_player = Player.new(player_2, "O")

board = Board.new

players = [x_player, o_player].shuffle
turn_index = 0

while board.empty_spaces? && !board.winner?
  current_player = players[turn_index]

  puts "It is #{current_player.name}'s turn."

  puts "What column do you want to play (A, B, C, D, E, F, or G)? "

  user_input = gets.chomp.downcase
    if user_input == "a"
      col_index = 0
    elsif user_input == "b"
      col_index = 1
    elsif user_input == "c"
      col_index = 2
    elsif user_input == "d"
      col_index = 3
    elsif user_input == "e"
      col_index = 4
    elsif user_input == "f"
      col_index = 5
    elsif user_input == "g"
      col_index = 6
    elsif user_input != ("a" || "b" || "c" || "d" || "e" || "f" || "g")
      puts "Please select a valid column (A, B, C, D, E, F, or G)."
      redo
    end

  board.rows.each_with_index do |row, index|
    if row[col_index].occupied?
      @row_index = index - 1
      break
    else
      @row_index = 6
    end
  end

  if board.rows[0][col_index].occupied?
    redo
  end

  board.add_turn(current_player, @row_index, col_index)

  puts board.print

  turn_index = turn_index == 0 ? 1 : 0

  if board.winner? == true
    puts "Congratulations, #{current_player.name}! You won!"
  end

  if board.empty_spaces? == false
    puts "Stalemate! There are no more spaces to play. Would you like to play again?"
    new_game = gets.chomp.downcase
    if new_game == "y"
      board = Board.new
      redo
    else
      break
    end
  end
end
