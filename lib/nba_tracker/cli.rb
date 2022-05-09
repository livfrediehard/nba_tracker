class NbaTracker::CLI
  def call
    puts "Hi, White Hot Nation! Welcome to the goto source for CLI info on the Miami Heat!"
    puts ""
    puts"                      ."
    puts"                    ,-; . ,"
    puts"           ________i_,',//"
    puts"     _odHHHHHHHHHHHHHHHHbo_"
    puts"   dP^'         ;.| ||,; `^?b"
    puts"  |H           ))`'||/';    H|"
    puts"   ?bo.     .=;'   |||.' ,odP"
    puts"     `?oo.-','     ||'oodP'"
    puts"       /'  /      / |/"
    puts"      |   |    _-'  ||"
    puts"     ||  |   ,'     J|"
    puts"     | \ |   |     / |"
    puts"      |_\ L  L  .-' |"
    puts"       \.)`-.;-;__./"
    puts"         "
    puts"       by:Brian Odom"
    puts""
    @input= ""
    until @input == "exit"
    get_players
    list_players
    get_selection
    next_selection
    end
    goodbye
  end

  def get_players
    @players = NbaTracker::Player.all
  end

  def list_players
    puts "What player would you like more information on?"
    @players.each.with_index(1) do |player, index| 
      puts "#{index}. #{player.name}"
    end
    
  end

  def get_selection
    player_pick = gets.strip.to_i
    show_player_info(player_pick) if valid_input(player_pick, @players)
  end 
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end 
  
  def show_player_info(player_pick)
    player = @players[player_pick - 1] 
    print_player(player)
  end

  def print_player(player)
    puts "Name:      #{player.name}"
    puts "Position:  #{player.position}"
    puts "Jersey #:  #{player.jersey}"
  end
  
  def next_selection
    puts "Would you like to see another player? Enter Y or N"
  
    input = gets.strip.downcase
    if input == "y"
      list_players
    elsif input == "n"
      puts ""
      puts "Thank you! Have a great day!"
      exit
    else
      puts ""
      puts "I'm sorry, that is not an option."
      call
    end
  end
end