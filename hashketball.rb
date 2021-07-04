# Write your code here!
require 'pry'

def game_hash
  {
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
          :rebounds => 2, 
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
          :assists => 2, 
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

def num_points_scored(player)
  points = nil
  game_hash.each do |team, data|
    if data[:players][player]
      points = data[:players][player][:points]
    end
  end
  points
end

def shoe_size(player)
  size = nil
  game_hash.each do |team, data|
    if data[:players][player]
      size = data[:players][player][:shoe]
    end
  end
  size
end

def team_colors(team_name)
  colors = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      colors = team_data[:colors]
    end
  end
  colors
end

def team_names
  name_of_teams = []
  game_hash.each do |location, team_data|
    team_data.each do |data, info|
      if data == :team_name
        name_of_teams << info
      end
    end
  end
  name_of_teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, team_data|
      if team_data[:team_name] == team_name
        if team_data[:players]
          team_data[:players].each do |name, stats|
            if stats[:number]
              numbers << stats[:number]
            end
          end
        end
      end
    end
    numbers
end

def player_stats(player_name)
  player_stats = {}
  game_hash.each do |location, team_data|
    if team_data[:players][player_name]
      player_stats = team_data[:players][player_name]
    end
  end
  player_stats
end

def big_shoe_rebounds
  rebounds_of_big_foot = 0
  big_foot_shoe_size = 0
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      array_of_player_stat_values = stats.values
        if array_of_player_stat_values[1] > big_foot_shoe_size
          big_foot_shoe_size = array_of_player_stat_values[1]
          rebounds_of_big_foot = array_of_player_stat_values[3]
        end
      end
    end
  rebounds_of_big_foot
end

def most_points_scored
  player_name = ""
  most_points = 0
  
  game_hash.each do |location, team_data|
    team_data.each do |data, info|
      if data == :players
        info.each do |player, stats|
          array_of_player_stat_values = stats.values
          if array_of_player_stat_values[2] > most_points
            most_points = array_of_player_stat_values[2]
            player_name = player
          end
        end
      end
    end
  end
  player_name
end

def most_points_scored
  home_points = 0
  away_points = 0
  game_hash.each do |location, team_data|
    team_data.each do |data, info|
      if data == :players
        info.each do |player, stats|
          stats.each do |stat, value|
            if stat == :points
              home_points += value if location == :home
              away_points += value if location == :away
            end
          end
        end
      end
    end
  end
  home_points > away_points ? "Brooklyn Nets" : "Charlotte Hornets"
end            
                