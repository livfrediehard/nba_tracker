class NbaTracker::scraper
    def scrape_conference
        doc = Nokogiri::HTML(open("https://www.si.com/nba/standings"))
        binding.pry
    end
end