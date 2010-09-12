module ESPNFantasyNews
  class Player
    attr_reader :name, :espn_player_id, :position, :team

    def initialize(name, player_id, position, team)
      @name = name
      @espn_player_id = player_id
      @position = position
      @team = team
    end

    def to_s
      "#{self.name} - #{self.position} #{self.team}, id #{self.espn_player_id.to_s}"
    end
    
  end
end
