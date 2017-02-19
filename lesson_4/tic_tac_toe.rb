# tic_tac_toe.rb

require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
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

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_defense(brd)
  square = 0
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      square = line.select { |num| brd[num] = INITIAL_MARKER }
      square = square.pop
      break
    else
      next
    end
  end
  brd[square] = COMPUTER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
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

def overall_winner(player_score, computer_score, winning_score)
  case winning_score
  when player_score
    prompt "Player won the overall match with a total score of #{winning_score}"
  when computer_score
    prompt "Computer won the overall match with a total score of #{winning_score}"
  else
    return nil
  end
end

loop do
  computer_score = 0
  player_score = 0
  winning_score = 5
  board = initialize_board
  
  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)
  
  case detect_winner(board)
  when 'Player'
    prompt "#{detect_winner(board)} won!"
    player_score += 1
  when 'Computer'
    prompt "#{detect_winner(board)} won!"
    computer_score += 1
  else
    prompt "It's a tie!"
  end

  break unless overall_winner(player_score, computer_score, winning_score) == nil
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
