class NbaTracker::Player
    attr_accessor :name, :position, :jersey
    @@all = []
     
    def initialize(name, position, jersey)
        @name = name
        @position = position
        @jersey = jersey
        save
    end

    def self.all
        NbaTracker::Scraper.scrape_page if @@all.empty?
        @@all
    end

    def save
        @@all << self
    end
end