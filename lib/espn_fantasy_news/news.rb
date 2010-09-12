module ESPNFantasyNews
  class News
    attr_reader :espn_player_id, :text

    def initialize(player_id, text)
      @espn_player_id = player_id
      @text = text
    end
    
  end
end
