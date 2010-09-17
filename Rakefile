begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "espn-fantasy-news"
    gemspec.summary = "Scrapes ESPN Fantasy football news updates and player data"
    gemspec.description = "ESPN fantasy football has a list of players in their Universe, and it provides news updates on said players. This is a utility library used to scrape the data for use in other applications"
    gemspec.email = "petkanics@gmail.com"
    gemspec.homepage = "http://github.com/dob/espn-fantasy-news"
    gemspec.authors = ["Doug Petkanics"]
    gemspec.add_dependency 'nokogiri'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end
