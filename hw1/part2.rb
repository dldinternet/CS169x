class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
class BadGameError < StandardError ; end

def strategy?(strategy)
    if strategy == nil
      return false
    elsif !strategy.is_a?(String)
        return false
    elsif !strategy.upcase.match(/[RPS]/)
      return false
    else
      return true
    end
end
  
# P beats R; R beats S; S beats P; 
def rps_eval(s1,s2)
  wins = ["RS", "SP", "PR", "RR", "SS", "PP"]
  return wins.index(s1.upcase+s2.upcase) ? true : false  
#  return true if s1 == "P" and s2 == "R"
#  return true if s1 == "R" and s2 == "S"
#  return true if s1 == "S" and s2 == "P"
#  return true if s1 == s2
#  return false
end
  

def rps_result(m1, m2)
  raise NoSuchStrategyError unless strategy?(m1[1]) && strategy?(m2[1])
   rps_eval(m1[1],m2[1]) ? m1 : (rps_eval(m2[1],m1[1]) ? m2 : nil )
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  m1, m2 = game
  raise BadGameError unless m1.length == 2 and m2.length == 2
  rps_result m1, m2
end

def game?(game)
  return game[0][0].is_a?(String)
end


def rps_tournament_winner(tournament)
  if game?(tournament)
    return rps_game_winner(tournament)
  end
  rps_game_winner [rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])]  
end

#game = [ ["Armando", "P"], ["Dave", "S"] ] # Dave would win since S > P
#  
#puts rps_game_winner(game)
#
#tourney = [
#[
#    [ ["Armando", "P"], ["Dave", "S"] ],
#    [ ["Richard", "R"],  ["Michael", "S"] ],
#],
#[
#    [ ["Allen", "S"], ["Omer", "P"] ],
#    [ ["David E.", "R"], ["Richard X.", "P"] ]
#]
#]
#
#puts rps_tournament_winner(tourney)
