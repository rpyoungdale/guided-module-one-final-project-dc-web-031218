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
    puts "1. Enter New Game"
    puts "2. Total Wins"
    puts "3. Total Wins By Sport"
    puts "4. Total Games Played"
    puts "5. Total Games Played By Sport"
    puts "6. Find A Certain Score"
    puts "7. Delete Game"

    user_input = gets.chomp

    if user_input == "1"
      Round.store_new_game
    elsif user_input == "5"
      total_games_played_by_sport
    end
  end

  def gets_input
    get.chomp
  end

  def total_games_played_by_sport
    puts "Which sport?"
    sports_input = gets_input
    user_rounds_played_by_sport(sport_input)
  end
end
