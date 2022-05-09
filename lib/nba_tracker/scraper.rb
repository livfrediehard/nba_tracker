class NbaTracker::Scraper
  def self.scrape_page
    puts "Running Scraper..."

    url = "https://www.nba.com/heat/roster"
    page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(page.body)
    player_lists = parsed_page.css('div.roster__player')
    player_lists.each do |player_list|
      player = {
          name: player_list.css('h2.roster__player__header__heading').text,
          position: player_list.css('div.roster__player__header_position').text,
          jersey: player_list.css('div.roster__player__header_jnumber').text,
      }
      # create a new player and add it to the @@all array in the player class
      NbaTracker::Player.new(player[:name], player[:position], player[:jersey]) 
    end
  end
end


#name: player_list.css('h2.roster__player__header__heading').text,
#posiion: player_list.css('div.roster__player__header__position').text,
#number: player_list.css('div.roster__player__header__jnumber').text,
#stats: player_list.css('div.roster__player__info__stats').text
