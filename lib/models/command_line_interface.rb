require_relative './round.rb'

class CommandLineInterface

attr_reader :current_user

  def greet
    puts "Welcome to your personal GameTracker!"
  end

  def determine_user
  puts " Please enter your full name "
  user_name = gets_input
  @current_user = User.find_or_create_by(name: user_name)
  end

  def gets_user_input
    #ASK FOR NAME
    puts "-------------------------"
    puts "What do you want to do?"
    puts "-------------------------"
    puts "Please Select an Option:"
    puts "  1. Enter New Game"
    puts "  2. Total Wins"
    puts "  3. Total Wins By Sport"
    puts "  4. Total Games Played"
    puts "  5. Total Games Played By Sport"
    puts "  6. Find A Certain Score"
    puts "  7. Delete Game"

    selection_input = gets.chomp
  end

  def make_selection(selection_input)
    case selection_input
    when "1"
      create_game
    when "2"
      total_wins
    when "3"
      total_wins_by_sport
    when "4"
      total_games_played
    when "5"
      total_games_played_by_sport
    when "6"
      find_score
    when "7"
      delete_game
    end
  end

  def gets_input
    get.chomp
  end

  def create_new_round
    puts "what what the date of the game? please enter in the following format mm/dd/yyyy"
    date_input = gets_input
    puts "what sport did you play"
    sport_input = gets_input
    puts "please indicate result by typing one of the following options: 'Win' 'Lose' 'Tie'"
    result_input = gets_input
    puts "what was your individual final score?"
    score_input = gets_input
    puts "what was your opponent's final score"
    opponent_score_input = gets_input
    @current_user.upload_new_round(date_input, sport_input, result_input, user_score_input, opponent_score_input)
    "New round saved"
  end


  def total_wins
    @current_user.wins
  end

  def total_wins_by_sport
  puts "what sport wins?"
  sport_input = gets_input
  wins_by_sport(sport_input)
  end

  def total_games_played
    @current_user.user_total_rounds_played
  end

  def total_games_played_by_sport
    puts "Which sport?"
    sports_input = gets_input
    @current_user.user_rounds_played_by_sport(sport_input)
  end

  def find_score
    puts "What date did you play this game? Enter: mm/dd/yy"
    date_input = gets_input
    @current_user.find_round_score(date_input)
  end

  def delete_game
    puts "What date did you play this game? Enter: mm/dd/yy"
    date_input = gets_input
    @current_user.delete_round(date_input)
  end


end
end
