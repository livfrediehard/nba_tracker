class NbaTracker::CLI
    def call
        puts 'Welcome to The NBA Tracker!'
        get_conferences
        list_conferences
        get_user_conference
    end


    def get_conferences
        @conferences = NbaTracker::Conference.all
    end

    def list_conferences
        puts "Pick a conference to see the top teams."
        @conferences.each_with_index do |conference, index| 
            puts "#{index +1}. #{conference.name}"
        end
    end   

    def get_user_conference
        chosen_conference = gets.strip.to_i
        show_conference_for(chosen_conference) if valid_input(chosen_conference, @conferences)
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def show_teams_for(chosen_conference)
        conference = @conference[chosen_conference - 1]
        puts "Here are the teams for the  #{conference}"
    end
end