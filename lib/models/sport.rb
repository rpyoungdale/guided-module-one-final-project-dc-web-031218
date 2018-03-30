class Sport < ActiveRecord::Base
  has_many :rounds
  has_many :users, through: :rounds
end

#
# Wins - shows the count win count overall returning a single number
# Win by sport - shows count of win by sport -return single number and puts “Basketball - 6 wins”
#
# Rounds - total rounds played
# why doesn't ryan.rounds work
