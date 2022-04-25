require_relative "./nba_tracker/version"
require_relative "./nba_tracker/cli"
require_relative "./nba_tracker/team"
require_relative "./nba_tracker/scraper"
#require_relative "./nba_tracker/player"

require 'pry'
require 'nokogiri'
require 'open-uri'

module NbaTracker
  class Error < StandardError; end
  # Your code goes here...
end
