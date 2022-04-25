class NbaTracker::Team
    @@all = []
    attr_accessor :name, :ref

    def initialize(name, ref)
        @name = name
        @ref = ref
        save
    end

    def self.all
        NbaTracker::Scraper.scrape_teams if @@all.empty?
        @@all
    end

    def players
        NbaTracker::Scraper.scrape_players(self) if |@@players.empty?
        @players
    end

    def save
        @@all << self
    end
end