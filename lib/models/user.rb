class User < ActiveRecord::Base
  has_many :rounds
  has_many :sports, through: :rounds

  def wins
    puts Round.where({result: "Win", user_id: self.id}).count
  end

  def wins_by_sport(sport_input)
    sport = Sport.find_by(name: sport_input)
    puts Round.where({result: "Win", user_id: self.id, sport: sport}).count
  end

  # def total_rounds
  #   Round.where({user_id: self.id}).count
  # end

  def upload_new_round(date_input, sport_input, result_input, user_score_input, opponent_score_input)
    sport = Sport.find_or_create_by(name: sport_input)
    Round.create(user_id: self.id, date: date_input, sport_id: sport.id, user_score: user_score_input.to_i, opponent_score: opponent_score_input.to_i, result: result_input)
  end

  def user_total_rounds_played
    puts rounds.count
  end

  def user_rounds_played_by_sport(sport_input) #passing in a sport string
    sport_search = Sport.find_by(name: sport_input)
    puts Round.where(sport_id: sport_search.id).count
  end

  def find_round_score(date_input)
    round_search = Round.find_by(date: date_input)
    puts "#{round_search.user_score} - #{round_search.opponent_score}"
  end

  def delete_round(date_input) #string of a date
    round_search = Round.find_by(date: date_input)
    puts "Are you sure you want to delete #{round_search}? Y/N"
    user_input = gets.chomp
    if user_input == "Y"
      puts "#{round_search} deleted."
      Round.destroy(round_search.id)
    else
      puts "#{round_search} not deleted."
    end
  end
end
