class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  WIN_RULE = {'SP'=>true, 'SR'=>false, 'SS'=>true, 'PP'=>true, 'PR'=>true, 'PS'=>false, 'RP'=>false, 'RR'=>true, 'RS'=>true}

  def self.winner(player1, player2)
    
  win = WIN_RULE[player1[1] + player2[1]]
  
  raise NoSuchStrategyError.new("Strategy must be one of R,P,S") if win == nil
  
  win ? player1 : player2
  end

  def self.tournament_winner(tournament)
    begin
      winner(tournament[0], tournament[1])
    rescue
        winner(tournament_winner(tournament[0]), tournament_winner(tournament[1]))
    end
  end

end
