require 'test/unit'
require 'espn_fantasy_news'

class ParserTest < Test::Unit::TestCase

  def test_parse_players
    players = ESPNFantasyNews::Parser.players_from_url(ESPNFantasyNews::PLAYER_LIST_ENDPOINT)
    #players.each {|player| player.each {|key, val| puts "#{key}=#{val}" } }
    assert players != nil && players != {}
    assert players.length == 40
  end

end
