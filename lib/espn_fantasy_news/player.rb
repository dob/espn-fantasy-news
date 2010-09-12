module ESPNFantasyNews
  class Player
    attr_reader :name, :espn_player_id, :position, :team

    def initialize(name, player_id, position, team)
      self.name = name
      self.espn_player_id = player_id
      self.position = position
      self.team = team
    end
    
  end
end
