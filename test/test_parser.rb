require 'test/unit'
require 'espn_fantasy_news'

class ParserTest < Test::Unit::TestCase

  def test_parse_players
    players = ESPNFantasyNews::Parser.players_from_url(ESPNFantasyNews::PLAYER_LIST_ENDPOINT)
    assert players != nil && players != []
    assert players.length == 40
  end

  def test_parse_news
    news = ESPNFantasyNews::Parser.news_from_url(ESPNFantasyNews::NEWS_ENDPOINT)
    assert news != nil && news != []
  end

end
