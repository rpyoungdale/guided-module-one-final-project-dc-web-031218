class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :sport

  def self.store_new_game
    puts "What sport did you play today?"
    sport_input = gets.chomp #"basketball"
    sport = Sport.find_or_create_by(name: sport_input)
    puts "What was your score?"
    user_score_input = gets.chomp
    puts "What was your opponent's score?"
    opponent_score_input = gets.chomp
  end

end
