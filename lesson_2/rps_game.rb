# rps_game.rb

VALID_CHOICES = { 'r' => 'rock',
                  'p' => 'paper',
                  'sc' => 'scissors',
                  'l' => 'lizard',
                  'sp' => 'spock' }

WINNING_CHOICES = { 'rock' => %w(lizard scissors),
                    'paper' => %w(rock spock),
                    'scissors' => %w(paper lizard),
                    'lizard' => %w(paper spock),
                    'spock' => %w(rock scissors) }

player_score = 0
computer_score = 0
winning_score = 5

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_winner(player, computer)
  if WINNING_CHOICES[player].include?(computer)
    prompt("You won this round!")
  elsif WINNING_CHOICES[computer].include?(player)
    prompt("Computer won this round!")
  else
    prompt("It's a tie!")
  end
end

Kernel.puts("Welcome to the rock, paper, scissors, lizard, spock game!")
loop do
  choice = ''
  loop do
    prompt("Choose one of the following options:
            Type 'r' for rock,
            'p' for 'paper,
            'sc' for 'scissors,
            'l' for 'lizard',
            'sp' for 'spock'.")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.include?(choice)
      choice = VALID_CHOICES[choice]
      break
    else
      Kernel.puts("Sorry. That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.values.sample
  Kernel.puts("You chose: #{choice}. The computer chose: #{computer_choice}")
  display_winner(choice, computer_choice)

  # I want to wrap the following code in a method but I cannot seem to be able to do this 
  # without throwing a nil class no method error...

  if WINNING_CHOICES[choice].include?(computer_choice)
    player_score += 1
  elsif WINNING_CHOICES[computer_choice].include?(choice)
    computer_score += 1
  end

  if player_score == winning_score
    prompt("You won the overall match with #{winning_score} total victories!")
    break
  elsif computer_score == winning_score
    prompt("The computer won the overall match with #{winning_score} total victories!")
    break
  else
    prompt("Let's play again!")
  end
end

prompt("Thanks for playing!")
