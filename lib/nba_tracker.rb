require_relative "./nba_tracker/version"
require_relative "./nba_tracker/cli"
require_relative "./nba_tracker/conference"
require_relative "./nba_tracker/scraper"

require 'pry'
require 'nokogiri'

module NbaTracker
  class Error < StandardError; end
  # Your code goes here...
end
