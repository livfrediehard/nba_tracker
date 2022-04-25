class NbaTracker::Scraper
    def self.scrape_teams
        site = "https://www.nba.com/teams"

        page = Nokogiri::HTML(open(site))

        teams = page.css(".TeamFigure_tfMainLink__mH93D")
        
        teams.each do |t|
          name = t.text
          ref = t.attr("value")
          NbaTracker::Team.new(name, ref)
        end
    end   
end