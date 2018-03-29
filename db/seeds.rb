rob = User.create(name: "Rob")
niky = User.create(name: "Niky")
andrew = User.create(name: "Andrew")
jp = User.create(name: "JP")
mj = User.create(name: "Michael Jordan")
mor = User.create(name: "Mor")
ryan = User.create(name: "Ryan")
bruno = User.create(name: "Bruno")


soccer = Sport.create(name: "Soccer")
hockey = Sport.create(name: "Hockey")
volleyball = Sport.create(name: "Volleyball")
rugby = Sport.create(name: "Rugby")
curling = Sport.create(name: "Curling")
boxing = Sport.create(name: "Boxing")
tennis = Sport.create(name: "Tennis")
basketball = Sport.create(name: "Basketball")

rob_tennis = Round.create(
  user_id: rob.id,
  sport_id: tennis.id,
  user_score: 6,
  opponent_score: 1,
  result: "Win",
  date: "03/13/18"
)
andrew_boxing = Round.create(
  user_id: andrew.id,
  sport_id: boxing.id,
  user_score: 96,
  opponent_score: 75,
  result: "Win",
  date: "02/19/18"
)
ryan_soccer = Round.create(
  user_id: ryan.id,
  sport_id: soccer.id,
  user_score: 3,
  opponent_score: 3,
  result: "Tie",
  date: "11/08/17"
)
bruno_basketball = Round.create(
  user_id: bruno.id,
  sport_id: basketball.id,
  user_score: 21,
  opponent_score: 16,
  result: "Win",
  date: "05/10/17"
)
mor_rugby = Round.create(
  user_id: mor.id,
  sport_id: rugby.id,
  user_score: 0,
  opponent_score: 170,
  result: "Loss",
  date: "03/02/18"
)
