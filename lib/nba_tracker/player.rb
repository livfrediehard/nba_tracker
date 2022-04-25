class NbaTracker::Player
    attr_accessor :name, :team, :url
    @@all = []
     
    def initialize(name, team, url)
      @name = name
      @team = team
      @url = url
      @key_info = []
      # notify month about the event
      add_to_team
      save
    end 
    
    def self.all 
      @@all 
    end
    
    def add_to_team
      @team.player << self unless @team.players.include?(self)
    end 
    
    def get_event_details
      NbaTracker::Scraper.scrape_key_info(self) if @key_info.empty?
    end 
    
    def save
      @@all << self
    end