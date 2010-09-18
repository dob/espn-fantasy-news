module ESPNFantasyNews
  class Team
    attr_reader :name, :espn_player_ids

    def initialize(name, espn_player_ids)
      @name = name
      @espn_player_ids = espn_player_ids
    end

    def to_s
      self.name
    end
    
  end
end
