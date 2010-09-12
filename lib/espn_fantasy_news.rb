require 'rubygems'
require 'net/http'
require 'nokogiri'

module ESPNFantasyNews

  PLAYER_LIST_ENDPOINT = "http://games.espn.go.com/ffl/tools/projections"
  NEWS_ENDPOINT = "http://games.espn.go.com/ffl/resources/playernews"

end

directory = File.expand_path(File.dirname(__FILE__))

require File.join(directory, 'espn_fantasy_news', 'player')
require File.join(directory, 'espn_fantasy_news', 'parser')
