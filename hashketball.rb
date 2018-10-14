require "pry"



def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          }, 
          "Reggie Evans" => {
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12, 
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          },
          "Brook Lopez" => {
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          },
          "Mason Plumlee" => {
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 12,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          },
          "Jason Terry" => {
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds =>  2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
          }
      }
    },
    :away => {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players => {
          "Jeff Adrien" => {
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          }, 
          "Bismak Biyombo" => {
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4, 
            :assists => 7,
            :steals => 7,
            :blocks => 15,
            :slam_dunks => 10
          },
          "DeSagna Diop" => {
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          },
          "Ben Gordon" => {
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists=> 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          },
          "Brendan Haywood" => {
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 22,
            :blocks => 5,
            :slam_dunks => 12
          }
      }
    }
    
  }
  
end


def find_player(players_name)
  if game_hash[:home][:players].keys.include?(players_name)
    return  game_hash[:home][:players]
  elsif game_hash[:away][:players].keys.include?(players_name)
    return game_hash[:away][:players]
  end
end

def find_player_stats(players_name, sym)
 result = 0
 find_player(players_name).each do |name, hash|
  result = hash[sym] if name == players_name
 end
 result
end



def num_points_scored(players_name)
  find_player_stats(players_name,:points)
end

def shoe_size(players_name)
  find_player_stats(players_name,:shoe)
end

def team_colors(team_name)
  if game_hash[:home][:team_name].eql?(team_name)
    return game_hash[:home][:colors]
  else
    return game_hash[:away][:colors]
  end
end

def team_names
  result = []
  result << game_hash[:home][:team_name]
  result << game_hash[:away][:team_name]
  result
end

def find_location(team_name)
  if game_hash[:home][:team_name] == team_name
     game_hash[:home]
  else
    game_hash[:away]
  end
end

def player_numbers(team_name)
  result = []
  players = find_location(team_name)
  
  players[:players].each do |name,stats|
    stats.each do |stat, num|
      result << num if stat == :number
     end
  end
  result.sort
end

def player_stats(player_name)
 result = {}
  find_player(player_name).each do |name, stats|
     result = stats if name == player_name
  end
  result
end

def total_players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def big_shoe_rebounds
  biggest_size_shoe = 0
  rebounds = 0
  total_players.each do |name, stats|
     stats.each do |stat, num|
       biggest_size_shoe == num if stat == :shoe && num > biggest_size_shoe
       rebounds = num if stat == :rebounds
     end
  end
  rebounds
end


def most_points_scored
  name_most_points = ""
  points = 0
  
  total_players.each do |name, stats|
    stats.each do |stat, num|
      if stat == :points && num > points
        name_most_points = name
        points = num
      end
    end
  end
  name_most_points
end


def winning_team
  home_total = 0
    game_hash[:home][:players].each do |name, stats|
      stats.each do |stat, num|
       home_total += num  if stat == :points
      end
    end
  away_total = 0
    game_hash[:away][:players].each do |name, stats|
      stats.each do |stat, num|
        away_total += num if stat == :points
      end
    end
    
    home_total > away_total ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  longest_name = ""
  
  total_players.each do |name, stats|
    longest_name = name if name.length > longest_name.length
  end
  
  longest_name
end

def player_with_the_most_steals
  most_steals = ""
  steals = 0
  
  total_players.each do |name, stats|
    stats.each do |stat, num|
      if stat == :steals && num > steals
        steals = num
        most_steals = name
      end
    end
  end
  most_steals
end

def long_name_steals_a_ton?
  player_with_longest_name == player_with_the_most_steals
end







# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         binding.pry
 
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         data.each do |data_item|
#             binding.pry
#       end
#     end
#   end
# end

# good_practices










