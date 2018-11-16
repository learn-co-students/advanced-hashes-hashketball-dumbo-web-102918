# Write your code here!
require "pry"
  def game_hash
    team_info = {}

  team_info[:home] = {}
  team_info[:away] = {}

  team_info[:home][:team_name] = ""
  team_info[:home][:colors] = []
  team_info[:home][:players] = {}

  team_info[:away][:team_name] = ""
  team_info[:away][:colors] = []
  team_info[:away][:players] = {}

  team_info[:home][:team_name] = "Brooklyn Nets"
  team_info[:home][:colors] = ["Black", "White"]

  team_info[:away][:team_name] = "Charlotte Hornets"
  team_info[:away][:colors] = ["Turquoise", "Purple"]

  team_info[:home][:players]["Alan Anderson"] = {}
  team_info[:home][:players]["Reggie Evans"] = {}
  team_info[:home][:players]["Brook Lopez"] = {}
  team_info[:home][:players]["Mason Plumlee"] = {}
  team_info[:home][:players]["Jason Terry"] = {}

  team_info[:away][:players]["Jeff Adrien"] = {}
  team_info[:away][:players]["Bismak Biyombo"] = {}
  team_info[:away][:players]["DeSagna Diop"] = {}
  team_info[:away][:players]["Ben Gordon"] = {}
  team_info[:away][:players]["Brendan Haywood"] = {}


  player_info(team_info[:home][:players]["Alan Anderson"], 0, 16, 22, 12, 12, 3, 1, 1)
  player_info(team_info[:home][:players]["Reggie Evans"], 30, 14, 12, 12, 12, 12, 12, 7)
  player_info(team_info[:home][:players][ "Brook Lopez"], 11, 17, 17, 19, 10, 3, 1, 15)
  player_info(team_info[:home][:players]["Mason Plumlee"], 1, 19, 26, 12, 6, 3, 8, 5)
  player_info(team_info[:home][:players]["Jason Terry"], 31, 15, 19, 2, 2, 4, 11, 1)

  player_info(team_info[:away][:players]["Jeff Adrien"], 4, 18, 10, 1, 1, 2, 7, 2)
  player_info(team_info[:away][:players]["Bismak Biyombo"], 0, 16, 12, 4, 7, 7, 15, 10)
  player_info(team_info[:away][:players]["DeSagna Diop"], 2, 14, 24, 12, 12, 4, 5, 5)
  player_info(team_info[:away][:players]["Ben Gordon"], 8, 15, 33, 3, 2, 1, 1, 0)
  player_info(team_info[:away][:players]["Brendan Haywood"], 33, 15, 6, 12, 12, 22, 5, 12)
  team_info
end

#here I defined player_info with all their stats, I then called it above for each player
def player_info(player_hash, numbers, shoes, point, rebound, assist, steal, block, slam_dunk)

  player_hash[:number]= numbers
  player_hash[:shoe] = shoes
  player_hash[:points] = point
  player_hash[:rebounds] = rebound
  player_hash[:assists] = assist
  player_hash[:steals] = steal
  player_hash[:blocks] = block
  player_hash[:slam_dunks] = slam_dunk
  return player_hash
end


#build num_points_scored that takes in player and returns points
def num_points_scored(player)
home_team = game_hash[:home][:players]
away_team = game_hash[:away][:players]

  if home_team.keys.include?(player)
    home_team[player][:points]
  else
    away_team[player][:points]
  end
end


def shoe_size(player)
  home_team = game_hash[:home][:players]
  away_team = game_hash[:away][:players]

    if home_team.keys.include?(player)
      home_team[player][:shoe]
    else
      away_team[player][:shoe]
    end
  end

  def team_colors(name)
    if game_hash[:home][:team_name] == name
      game_hash[:home][:colors]
    else
      game_hash[:away][:colors]
    end
  end

def team_names
  names = []
  names << game_hash[:home][:team_name]
  names << game_hash[:away][:team_name]
  names
end

def player_numbers(name)
    jerseys = []
    home_players = game_hash[:home][:players]
    away_players =  game_hash[:away][:players]

    if game_hash[:home][:team_name] == name
      home_players.map do |player, stats_info|

        stats_info.select do |stats_name, stats_value|
           if stats_name == :number
              jerseys << stats_value
           end
        end
      end

    else
      away_players.map do |player, stats_info|

        stats_info.select do |stats_name, stats_value|
           if stats_name == :number
              jerseys << stats_value
            end
        end
      end
    end
    jerseys
end

def player_stats(player)
  home_team = game_hash[:home][:players]
  away_team = game_hash[:away][:players]

    if home_team.keys.include?(player)
      home_team[player]
    else
      away_team[player]
    end
end

def big_shoe_rebounds
  max_home = 0
  max_away = 0
  home_rebounds = 0
  away_rebounds = 0
  game_hash[:home][:players].select do |player_name, player_info|
      if max_home == 0
        max_home = player_info[:shoe]
        home_rebounds = player_info[:rebounds]
      elsif player_info[:shoe] > max_home
        max_home = player_info[:shoe]
        home_rebounds = player_info[:rebounds]
    end
  end
  game_hash[:away][:players].select do |player_name, player_info|
    if max_away == 0
      max_away = player_info[:shoe]
      away_rebounds = player_info[:rebounds]
    elsif player_info[:shoe] > max_away
      max_away = player_info[:shoe]
      away_rebounds = player_info[:rebounds]
    end
  end

  if max_home > max_away
    home_rebounds
  else
    away_rebounds
  end
end


def most_points_scored
  max_home = 0
  max_away = 0
  home_player = ""
  away_player = ""
  game_hash[:home][:players].select do |player_name, player_info|
      if max_home == 0
        max_home = player_info[:points]
        home_player = player_name
      elsif player_info[:points] > max_home
        max_home = player_info[:points]
        home_player = player_name
    end
  end
  game_hash[:away][:players].select do |player_name, player_info|
    if max_away == 0
      max_away = player_info[:points]
      away_player = player_name
    elsif player_info[:points] > max_away
      max_away = player_info[:points]
      away_player = player_name
    end
  end

  if max_home > max_away
    home_player
  else
    away_player
  end
end


def winning_team

  home_points = []
  away_points = []
  game_hash[:home][:players].select do |player_name, player_info|
    home_points <<player_info[:points]
  end

  game_hash[:away][:players].select do |player_name, player_info|
    away_points << player_info[:points]
  end
  home_total = home_points.sum
  away_total = away_points.sum

  if home_total > away_total
  game_hash[:home][:team_name]

  else
  game_hash[:away][:team_name]
  end
  #[home_total, away_total].max
end

def player_with_longest_name
  home_players = game_hash[:home][:players].keys
  home_player = home_players.max_by(&:length)

  away_players = game_hash[:away][:players].keys
  away_player = away_players.max_by(&:length)

  if home_player.length > away_player.length
    home_player
 else
   away_player
 end
end


def most_steals
  max_home = 0
  max_away = 0
  home_player = ""
  away_player = ""
  game_hash[:home][:players].select do |player_name, player_info|
      if max_home == 0
        max_home = player_info[:steals]
        home_player = player_name
      elsif player_info[:steals] > max_home
        max_home = player_info[:steals]
        home_player = player_name
    end
  end
  game_hash[:away][:players].select do |player_name, player_info|
    if max_away == 0
      max_away = player_info[:steals]
      away_player = player_name
    elsif player_info[:steals] > max_away
      max_away = player_info[:steals]
      away_player = player_name
    end
  end

  if max_home > max_away
    home_player
  else
    away_player
  end
end

def long_name_steals_a_ton
  if most_steals == player_with_longest_name
    true
 else
   false
 end
end
