require 'open-uri'

module ESPNFantasyNews

  class Parser

    # Load the entire universe of ESPN players
    def self.load_all_players
      offset = 0
      res = []
      while offset <= 1080 do
        url = ESPNFantasyNews::PLAYER_LIST_ENDPOINT + "?startIndex=#{offset.to_s}"
        res += self.players_from_url(url)
        offset += 40
      end
      res
    end
    
    # Load all the players at the url
    def self.players_from_url(url)
      doc = Nokogiri::HTML(open(url))
      player_attributes = doc.css('.pncPlayerRow').collect do |x|
        cell = x.css('td')[1]
        cell_text = cell.text
        name, teampos = cell_text.split(',')
        team, pos = self.split_string_on_char_194(teampos.strip)
        player_id = cell.css('a')[0].get_attribute('playerid').to_i

        pos = self.parse_pos(pos)          

        # Remove the asterisk from players who are on the IR
        name = name[0, name.length - 1] if name[-1, 1] == "*"

        ESPNFantasyNews::Player.new(name, player_id, pos, team)
      end
      player_attributes
    end

    # Return all the latest news stories
    def self.load_all_news
      self.news_from_url(ESPNFantasyNews::NEWS_ENDPOINT)
    end

    # Return all the news stories from the given url
    def self.news_from_url(url)
      doc = Nokogiri::HTML(open(url))
      news_attributes = doc.css('tr.tableBody').collect do |player_row|
        player_id = player_row.css('a')[0].get_attribute('playerid').to_i
        text = player_row.css('.pni-shorttext')[0].content

        ESPNFantasyNews::News.new(player_id, text)
      end
      news_attributes
    end

    # Return an array of espn player ids for the players on the team at URL
    def self.load_team_player_ids(url)
      ids = []
      doc = Nokogiri::HTML(open(url))
      player_row = doc.css('.pncPlayerRow').each do |row|
        link = row.css('a')[0]
        if link
          player_id = link.get_attribute('playerid').to_i
          ids << player_id
        end
      end
      ids
    end

    private

    # It isn't a space that seperates the team and position, it's ascii char 194 for some reason?
    def self.split_string_on_char_194(str)
      return str if (str.nil? || str.length < 4)

      if str[2].to_i == 194
        return str[0,2], str[4, str.length - 4]
      elsif str[3].to_i == 194
        return str[0,3], str[5, str.length - 4]
      end
    end

    def self.parse_pos(pos)
      self.positions[pos[0,1]]
    end

    # Garbage characters get included if there's an injury, so just use the first letter
    def self.positions
      {
        "Q" => "QB",
        "R" => "RB",
        "W" => "WR",
        "T" => "TE",
        "K" => "K",
        "D" => "D/ST"
      }
    end

  end

end
