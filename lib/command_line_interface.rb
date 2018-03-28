require_relative './round.rb'

class CommandLineInterface
  def greet
    puts "Welcome to your personal GameTracker!"
  end

  def gets_user_input
    #ASK FOR NAME
    puts "What do you want to do?"
    puts "Please Select an Option: 1. Enter New Game, 2. Total Wins, 3. Total Wins By Sport, 4. Total Games Played, 5. Total Games By Sport, 6. Delete Game"
    user_input = gets.chomp
    if user_input == "1"
      Round.store_new_game
    end
  end
end
