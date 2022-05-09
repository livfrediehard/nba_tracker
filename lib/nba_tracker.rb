require_relative "./nba_tracker/version"
require_relative "./nba_tracker/cli"
require_relative "./nba_tracker/player"
require_relative "./nba_tracker/scraper"


require 'pry'
require 'nokogiri'
require 'open-uri'
require 'httparty'
require 'byebug'

module NbaTracker
  class Error < StandardError; end
  # Your code goes here...
end
