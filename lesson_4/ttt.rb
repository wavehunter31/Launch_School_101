require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], 
                [1, 4, 7], [2, 5, 8], [3, 6, 9],
                [1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  puts "You're an #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  system 'clear'
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]} "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]} "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]} "
  puts "     |     |"
  puts ""
end
# rubocop: enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER}
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER}
end

def joinor(array, delim = ', ', join_word = 'or')
  string = ''
  array.insert(-2, join_word) unless array.length < 2
  array.each do |element|
    if element == join_word
      string << "#{element} "
    elsif element == array.last
      string << "#{element}"
    else
      string << "#{element}" + delim
    end
  end
  return string
end

def player_places_piece!(brd)
  square = ''
  loop do 
    prompt "Choose a square (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def square_alert?(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      return true
    else
      next
    end
  end
end

def chance_to_win?(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).include?(PLAYER_MARKER)
       return false
       break
    else
      return true
    end
  end
end

def computer_defense!(brd)
  WINNING_LINES.each do |line|
    if (brd.values_at(*line).count(PLAYER_MARKER) == 2) && (brd.values_at(*line).count(INITIAL_MARKER) == 1)
       square = line.select { |num| brd[num] == INITIAL_MARKER }
       square = square.pop
       brd[square] = COMPUTER_MARKER
       break
    else
      next
    end
  end 
end

def computer_offense!(brd)
  WINNING_LINES.each do |line|
    case brd.values_at(*line).include?(PLAYER_MARKER)
    when true
      square = line.select { |num| brd[num] == INITIAL_MARKER }
      square = square.pop
      brd[square] = COMPUTER_MARKER
      break
    else
      next
    end
  end
end

def computer_places_piece!(brd)
  if chance_to_win?(brd)
    computer_offense!(brd)
  elsif square_alert?(brd)
    computer_defense!(brd)
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

computer_score = 0
player_score = 0
winning_score = 5

loop do 

  board = initialize_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)
 
  if detect_winner(board) == 'Player'
    prompt "Player won!"
    player_score += 1
  elsif detect_winner(board) == 'Computer'
    prompt "Computer won!"
    computer_score += 1
  else
    prompt "It's a tie!"
  end

  prompt "Score -- Player: #{player_score}, Computer: #{computer_score}"

  if computer_score != winning_score && player_score != winning_score
    prompt "Would you like to play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase == 'y'
  else
    break
  end

end

prompt "Thanks for playing Tic, Tac, Toe! Good bye!"



