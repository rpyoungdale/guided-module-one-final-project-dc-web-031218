class CommandLineInterface

  attr_reader :current_user

  def greet
    system "clear"
    puts '
   .___  ___.   ______   .______     ____    ____  ___      .__   __.
   |   \/   |  /  __  \  |   _  \    \   \  /   / /   \     |  \ |  |
   |  \  /  | |  |  |  | |  |_)  |    \   \/   / /  ^  \    |   \|  |
   |  |\/|  | |  |  |  | |      /      \_    _/ /  /_\  \   |  . `  |
   |  |  |  | |  `--`  | |  |\  \----.   |  |  /  _____  \  |  |\   |
   |__|  |__|  \______/  | _| `._____|   |__| /__/     \__\ |__| \__| '
    #puts "                                 ---                             "
    puts "\n                      -- MoRyan Incorporated --                  "
    puts "                                 ---                             "
    #sleep(3)
    puts "                Welcome to your personal GameTracker!            "
    #sleep(3)
  end

  def determine_user
    system "clear"
    puts "               Please enter a new or existing username:          "
    user_name = gets_input
    @current_user = User.find_or_create_by(name: user_name)
    puts "-------------------------"
    puts "Welcome #{user_name}!"
    #sleep(3)
    system "clear"
  end

  def gets_user_input
    puts "What do you want to do?"
    puts "-------------------------"
    puts "Please Select an Option:"
    puts "   1. Enter New Game", "   2. Total Wins", "   3. Total Wins By Sport", "   4. Total Games Played", "   5. Total Games Played By Sport", "   6. Find A Certain Score", "   7. Delete Game", "   8. Exit GameTracker"

    selection_input = gets_input

    case selection_input
    when "1"
      create_new_round
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
    when "8"
      return
    else
      puts "We're sorry. That is not an option."
    end

    puts "\n Continue? yes/no "

    if gets_input != "no"
      system "clear"
      gets_user_input
    end
  end

  def gets_input
    puts "\n -- Answer Below --"
    gets.chomp
  end

  def create_new_round
    system "clear"
    puts "When did you play this game? Enter: mm/dd/yy"
    date_input = gets_input
    system "clear"
    puts "What sport did you play today?"
    sport_input = gets_input
    system "clear"
    puts "Please indicate game result: 'Win' 'Loss' 'Tie'"
    result_input = gets_input
    system "clear"
    puts "What was your individual final score?"
    score_input = gets_input
    system "clear"
    puts "What was your opponent's final score?"
    opponent_score_input = gets_input
    @current_user.upload_new_round(date_input, sport_input, result_input, score_input, opponent_score_input)
    system "clear"
    puts "-- GAME SAVED --"
  end

  def total_wins
    @current_user.wins
  end

  def total_wins_by_sport
    puts "Which sport?"
    sport_input = gets_input
    @current_user.wins_by_sport(sport_input)
  end

  def total_games_played
    @current_user.user_total_rounds_played
  end

  def total_games_played_by_sport
    puts "Which sport?"
    sports_input = gets_input
    @current_user.user_rounds_played_by_sport(sports_input)
  end

  def find_score
    puts "\n What date did you play this game?"
    puts "-----------------------------------"
    show_date_options
    date_input = gets_input
    @current_user.find_round_score(date_input)
  end

  def delete_game
    if @current_user.rounds.count > 0 #CHANGE
      puts "\n Which game would you like to delete? Enter date:"
      puts " -----------------------------------"
      show_date_options
      date_input = gets_input
      @current_user.delete_round(date_input)
    else
      puts "\n You have no games to delete."
    end
  end

  def show_date_options
    @current_user.rounds.collect {|round| puts "\n #{round.sport.name} #{round.date}"}
  end

end
