class NbaTracker::CLI
    def call
        puts "\nWelcome to The NBA Tracker!\n"
        get_teams
        list_teams
        get_user_team
        valid_input
        show_teams_for
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

    def get_user_team
        chosen_team = gets.strip.to_i
        show_team_for(chosen_team) if valid_input(chosen_team, @teams)
        binding.pry
    end


    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def show_teams_for(chosen_team)
        team = @team[chosen_team - 1]
        puts "Here are NBA's finest #{team.name}"
        team.players.each.with_index(1) do |players, idx|
          puts "#{idx}. #{player.name}"
        end
        get_user_player(team)
    end


    def get_user_player(team)
        puts "Choose a player to see more"
        input = gets.strip
        event = team.events[input.to_i - 1]
        event.get_player_details
        show_player_details(player)
    end

    def show_player_details(player)
        puts player.name
        player.key_info.each {|i| puts "- #{i}"}
    end 

    def what_next
        puts "Are you done? Type 'exit' to exit or hit any key to see more players."
        @input = gets.strip
    end 

    def goodbye
        puts "Enjoy Sports!"
    end 
end