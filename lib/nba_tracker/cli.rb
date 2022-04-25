class NbaTracker::CLI
    def call
        puts "\nWelcome to The NBA Tracker!\n"
        get_teams
        list_teams
        get_user_team
        valid_input
        show_players_for
    end


    def get_teams
        #NbaTracker::Scraper.scrape_teams
        @teams = NbaTracker::Team.all
    end

    def list_teams
        puts "Pick a team to see more information."
        @teams.each_with_index(1) do |team, index| 
            puts "#{index}. #{team.name}"
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

    def show_players_for(chosen_team)
        team = @team[chosen_team - 1]
        players = teams.players
        puts "Here are NBA's finest that play for The #{team.name}"





        team.players.each.with_index(1) do |players, index|
          puts "#{index}. #{player.name}"
        end
        get_user_player(team)
    end



end