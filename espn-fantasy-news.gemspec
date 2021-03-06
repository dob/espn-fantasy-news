# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{espn-fantasy-news}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Doug Petkanics"]
  s.date = %q{2011-09-02}
  s.description = %q{ESPN fantasy football has a list of players in their Universe, and it provides news updates on said players. This is a utility library used to scrape the data for use in other applications}
  s.email = %q{petkanics@gmail.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "README",
    "Rakefile",
    "VERSION",
    "espn-fantasy-news.gemspec",
    "lib/espn_fantasy_news.rb",
    "lib/espn_fantasy_news/news.rb",
    "lib/espn_fantasy_news/parser.rb",
    "lib/espn_fantasy_news/player.rb",
    "lib/espn_fantasy_news/team.rb",
    "test/suite.rb",
    "test/test_parser.rb"
  ]
  s.homepage = %q{http://github.com/dob/espn-fantasy-news}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Scrapes ESPN Fantasy football news updates and player data}
  s.test_files = [
    "test/suite.rb",
    "test/test_parser.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 0"])
  end
end

