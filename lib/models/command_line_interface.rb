require_relative './round.rb'

class CommandLineInterface
  def greet
    puts "Welcome to your personal GameTracker!"
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

    user_input = gets.chomp

    case user_input

    when "1"
      #Round.store_new_game
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

  def create_game
  end

  def total_wins
  end

  def total_wins_by_sport
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
