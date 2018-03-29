class User < ActiveRecord::Base
  has_many :rounds
  has_many :sports, through: :rounds

  def wins
    system "clear"
    puts "-- You've won #{Round.where({result: "Win", user_id: self.id}).count} game(s) --"
  end

  def wins_by_sport(sport_input)
    system "clear"
    sport = Sport.find_by(name: sport_input)
    puts "-- You've won #{Round.where({result: "Win", user_id: self.id, sport: sport}).count} game(s) of #{sport_input} --"
  end

  # def total_rounds
  #   Round.where({user_id: self.id}).count
  # end

  def upload_new_round(date_input, sport_input, result_input, user_score_input, opponent_score_input)
    system "clear"
    sport = Sport.find_or_create_by(name: sport_input)
    Round.create(user_id: self.id, date: date_input, sport_id: sport.id, user_score: user_score_input.to_i, opponent_score: opponent_score_input.to_i, result: result_input)
  end

  def user_total_rounds_played
    system "clear"
    puts "-- You've played #{rounds.count} game(s) --"
  end

  def user_rounds_played_by_sport(sport_input) #passing in a sport string
    system "clear"
    sport_search = Sport.find_or_create_by(name: sport_input)
    puts "-- You've played #{Round.where({sport_id: sport_search.id, user_id: self.id}).count} game(s) of #{sport_input} --"
  end

  def find_round_score(date_input)
    system "clear"
    round_search = Round.find_by(date: date_input)
    puts "-- The game's score was #{round_search.user_score} to #{round_search.opponent_score} --"
  end

  def delete_round(date_input) #string of a date
    system "clear"
    round_search = Round.find_by(date: date_input)
    puts "Are you sure you want to delete the game from #{round_search.date}? yes/no"
    user_input = gets.chomp
    if user_input == "yes"
      if round_search
        puts "-- The game has been deleted --"
        Round.destroy(round_search.id)
      else
        puts "-- This game does not exist --"
      end
    else
      puts "-- The game from #{round_search.date} was not deleted --"
    end
  end
end
