class User < ActiveRecord::Base
  has_many :rounds
  has_many :sports, through: :rounds



def wins
Round.where({result: "Win", user_id: self.id}).count
end


def wins_by_sport(sport_input)
sport = Sport.find_by(name: sport_input)
Round.where({result: "Win", user_id: self.id, sport: sport}).count
end

def total_rounds
Round.where({user_id: self.id}).count
end


def upload_new_game(date_input, sport_input, user_score_input, opponent_score_input)
  sport = Sport.find_by(name: sport_input)
  if user_score_input.to_i > opponent_score_input.to_i
                        result_calculation = "Win"
  elsif user_score_input.to_i < opponent_score_input.to_i
    result_calculation = "Loss"
  else
    result_calculation = "Tie"

Round.create(user_id: self.id, date: date_input sport_id: sport, user_score: user_score_input.to_i opponent_score: opponent_score_input.to_f, result: result_calculation)
    # puts "What sport did you play today?"
    # sport_input = gets.chomp #"basketball"
    # sport = Sport.find_or_create_by(name: sport_input)
    # puts "What was your score?"
    # user_score_input = gets.chomp
    # puts "What was your opponent's score?"
    # opponent_score_input = gets.chomp
  end



  
end
