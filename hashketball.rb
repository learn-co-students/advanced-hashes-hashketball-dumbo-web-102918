# Write your code here!

def game_hash
  game_hash = {
:home => {
  :team_name => "Brooklyn Nets", 
  :colors => ["Black", "White"], 
  :players => {
    "Alan Anderson" => {
      number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1}, 
    "Reggie Evans" => {
      number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7}, 
    "Brook Lopez" => {
      number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15}, 
    "Mason Plumlee" => {
      number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5}, 
    "Jason Terry" => {
      number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}}}, 
:away => {
  :team_name => "Charlotte Hornets", 
  :colors => ["Turquoise", "Purple"], 
  :players => {
    "Jeff Adrien" => {
      number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
    "Bismak Biyombo" => {
      number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
    "DeSagna Diop" => {
      number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
    "Ben Gordon" => {
      number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
    "Brendan Haywood" => {
      number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}}}}
end

def num_points_scored(player)
  num_points = 0
  game_hash.each do |location, team|
    team.each do |properties, data|
      if properties == :players
        data.each do |name, stats|
          if name == player
            num_points = stats[:points]
          end
        end
      end
    end
  end
  num_points
end

def shoe_size(player)
  game_hash.each do |location, team|
    team.each do |properties, data|
      if properties == :players
        data.each do |name, stats|
          if name == player
            return stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_name|
    if team_name[:team_name] == team
      return team_name[:colors]
    end
  end
end

def team_names
  game_hash.collect do |location, team|
    team[:team_name]
  end
end

def player_numbers(team)
  jersey_numbers = []
  game_hash.each do |location, team_name|
    if team_name[:team_name] == team
      team_name.each do |properties, data|
        if properties == :players
          data.each do |name, stats|
            jersey_numbers << stats[:number]
          end
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(player)
  game_hash.each do |location, team_name|
    team_name.each do |properties, data|
      if properties == :players
        data.each do |name, stats|
          if name == player
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe = 0
  rebounds = 0
  game_hash.each do |location, team_name|
    team_name.each do |properties, data|
      if properties == :players
        data.each do |name, stats|
          if stats[:shoe] > largest_shoe
            rebounds = stats[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end

###########################
#bonus

def most_points_scored
  most_points = 0
  player_name = ""
  game_hash.each do |location, team_name|
    team_name.each do |properties, data|
      if properties == :players
        data.each do |name, stats|
          if most_points < stats[:points]
            player_name = name
            most_points = stats[:points]
          end
        end
      end
    end
  end
  player_name
end

def winning_team
  home_team_points = 0
  away_team_points = 0
  
  game_hash.each do |location, team_name|
    if location == :home
      team_name.each do |properties, data|
          if properties == :players
            data.each do |name, stats|
              home_team_points += stats[:points]
            end
          end
      end
    else
      team_name.each do |properties, data|
        if properties == :players
          data.each do |name, stats|
            away_team_points += stats[:points]
          end
        end
      end
    end
  end
  
  if home_team_points > away_team_points
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name = ""
  name_length = 0
  
  game_hash.each do |location, team_name|
    team_name.each do |properties, data|
      if properties == :players
        data.each do |name, stats|
          if name_length < name.length
            longest_name = name
          end
        end
      end
    end
  end
  longest_name
end

##########################
# Super Bonus
def long_name_steals_a_ton?
  #call longest_name and find out value of steals
  longest_name_steals = 0
  game_hash.each do |location, team_name|
    team_name.each do |properties, data|
      if properties == :players
        data.each do |name, stats|
          if player_with_longest_name == name
            longest_name_steals = stats[:steals]
          end
        end
      end
    end
  end
  
  game_hash.each do |location, team_name|
    team_name.each do |properties, data|
      if properties == :players
        data.each do |name, stats|
          if stats[:steals] > longest_name_steals
            return false
          end
        end
      end
    end
  end
  return true
end