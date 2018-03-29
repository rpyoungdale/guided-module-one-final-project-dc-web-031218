class User < ActiveRecord::Base
  has_many :rounds
  has_many :sports, through: :rounds

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
    if user_input = "Y"
      puts "#{round_search} deleted."
      Round.destroy(round_search.id)
    else
      puts "#{round_search} not deleted."
    end
  end
end
