require 'open-uri'

module ESPNFantasyNews

  class Parser
    
    def self.players_from_url(url)
      doc = Nokogiri::HTML(open(url))
      player_attributes = doc.css('.pncPlayerRow').collect do |x|
        cell = x.css('td')[1]
        cell_text = cell.text
        name, teampos = cell_text.split(',')
        team, pos = self.split_string_on_char_194(teampos.strip)
        player_id = cell.css('a')[0].get_attribute('playerid').to_i

        # Remove the asterisk from players who are on the IR
        name = name[0, name.length - 1] if name[-1, 1] == "*"

        ESPNFantasyNews::Player.new(name, player_id, pos, team)
      end
      player_attributes
    end

    def self.news_from_url(url)
      doc = Nokogiri::HTML(open(url))
      news_attributes = doc.css('tr.tableBody').collect do |player_row|
        player_id = player_row.css('a')[0].get_attribute('playerid').to_i
        text = player_row.css('.pni-shorttext')[0].content

        ESPNFantasyNews::News.new(player_id, text)
      end
      news_attributes
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

  end

end
