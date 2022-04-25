class NbaTracker::CLI
    def call
        puts 'Welcome to The NBA Tracker!'
        get_teams
        list_teams
    end


    def get_teams
        #NbaTracker::Scraper.scrape_teams
        @teams = NbaTracker::Team.all
    end

    def list_teams
        puts "Pick a team to see more information."
        @teams.each_with_index do |team, index| 
            puts "#{index +1}. #{team.name}"
        end
    end   
end
