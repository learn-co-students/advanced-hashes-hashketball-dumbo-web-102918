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
#have to go thru the keys in each loop with if statements for the right key
def num_points_scored(player_name)
  num_points = 0
  game_hash.each do |location, team_data|
    #location is just home or away, team_data is all the data for home
    team_data.each do |attribute, data|
      #attribute goes thru team name, colors and players to get their values
      #for team name, will get brooklyn or the other
      #  for colors will get the array of colors
      #for players will get whole hash, player name and all their stats
       if attribute == :players
         data.each do |name, stat_list|
          # data_item would be player name, gets entire hash of stats for values
           stat_list.each do |stat, value|
             #looks into stats hash
             #these are all the names of stats and all their values
             if name == player_name && stat == :points
              num_points = value
             end
           end
         end
       end
    end
  end
  num_points
end

#same as above, cycling thru if statements in the keys for various loops
def shoe_size(player_name)
  shoe_size = 0
  game_hash.each do |location, team_data|
    #location is just home or away, team_data is all the data for home
    team_data.each do |attribute, data|
      #attribute goes thru team name, colors and players to get their values
      #for team name, will get brooklyn or the other
      #  for colors will get the array of colors
      #for players will get whole hash, player name and all their stats
       if attribute == :players
         data.each do |data_item, stat_list|
          # data_item would be player name, gets entire hash of stats for values
           stat_list.each do |stat, value|
             #looks into stats hash
             #these are all the names of stats and all their values
             if data_item == player_name && stat == :shoe
              shoe_size = value
             end
           end
         end
       end
    end
  end
  shoe_size
end

#this one tricky because name_of_team is on same level as :colors
#so go up and use variable location, then actually name :colors in the path
def team_colors (name_of_team)
  colors_team = []
  game_hash.each do |location, team_data|
    #location is just home or away, team_data is all the data for home
    team_data.each do |attribute, data|
      #attribute goes thru team name, colors and players to get their values
      #for team name, will get brooklyn or the other
      #  for colors will get the array of colors
      #for players will get whole hash, player name and all their stats
        if data == name_of_team
          colors_team = (game_hash[location][:colors])
          #you use key that was above name of team and in its path
          #so ok to call it location I think
          #then you use colors as the key for this level
        end
      end
    end
    colors_team
  end

#another way is to just name the path, since you know for the two team_colors
#that location will be either home or away, depending on team name
def team_colors (name_of_team)

  if name_of_team == "Charlotte Hornets"
    game_hash[:away][:colors]

  else
    game_hash[:home][:colors]
  end

end

#this one was normal
def team_names
  name_array = []
  game_hash.each do |location, team_data|
    #location is just home or away, team_data is all the data for home
    team_data.each do |attribute, data|
      #attribute goes thru team name, colors and players to get their values
      #for team name, will get brooklyn or the other
      #  for colors will get the array of colors
      #for players will get whole hash, player name and all their stats
        if attribute == :team_name
          name_array.push(game_hash[location][:team_name])
        end
    end
  end
  name_array
end
# here the problem is name of team is string and ruby can't loop thru it
#so skip steps by calling team_data[:team_name] and team_data[:players]
def player_numbers (team)
  number_array = []
  game_hash.each do |location, team_data|
  #location is just home or away, team_data is all the data for home
    if team_data[:team_name] == team
      #can get value by calling hash[key]
      # using team_data[:team_name] skips attribute, data loop which was causing problems becuase
      #can't loop thru the data string
      team_data[:players].each do |data_item, stat_list|
          # data_item would be player name, gets entire hash of stats for values
          #can skip |stat, value| loop and just say stat_list[:number] as we know
          #we are can get value by calling hash[key]
         number_array << stat_list[:number]
      end
    end
  end
  number_array
end















# #another way made a function for team_stats which you calla nd then use fetch for team_name
# def player_numbers(team_name)
#   #find is select but only returns first element for which is true
#   #fetch(key_name): get the value if the key exist
#
#   find_numbers = team_stats.find {|team| team.fetch(:team_name) == team_name}
#   find_numbers[:players].collect do |player|
#     player[:number]
#   end
# end
#
# def team_stats
#   #get multiple non-sequential values from hash , use values_at
#   home_team = game_hash.values_at(:home)
#   away_team = game_hash.values_at(:away)
#   total_team_stats = home_team + away_team
#   total_team_stats
# end

#fetch(key_name): get the value if the key exists, raise a KeyError if it doesn't
#fetch(key_name, default_value): get the value if the key exists, return default_value otherwise
#fetch(key_name) { |key| "default" }: get the value if the key exists, otherwise run the supplied block and return the value.
#Each one should be used as the situation requires, but #fetch is very feature-rich and can handle many cases depending on how it's used. For that reason I tend to prefer it over accessing keys with #[].


def player_stats(name_of_player)
  game_hash.keys.each do |team_info|
    if game_hash[team_info][:players].keys.include?(name_of_player)
      return game_hash[team_info][:players][name_of_player]
    end
  end
end



def big_shoe_rebounds
   largest_size = 0
   rebound_number = 0
   game_hash.each do |location, team_data|
#       #location is just home or away, team_data is all the data for home
      team_data.each do |attribute, data|
#         #attribute goes thru team name, colors and players to get their values
#         #for team name, will get brooklyn or the other
#         #  for colors will get the array of colors
#         #for players will get whole hash, player name and all their stats
         if attribute == :players
           data.each do |name, stat_list|
#             # data_item would be player name, gets entire hash of stats for values
              stat_list.each do |stat, value|
#                #looks into stats hash
#                #these are all the names of stats and all their values
                 if stat == :shoe
                   if largest_size = 0
                     largest_size = value
                     #this is the first initialization
                     rebound_number = game_hash[location][:players][name][:rebounds]

                   elsif value > largest_size
                     largest_size = value
                      rebound_number = game_hash[location][:players][name][:rebounds]
                   end
                end
             end
           end
        end
      end
    end
    rebound_number
 end











#doesnt work , gets undefined local variable for object
# def player_stats (name_of_player)
# #statistics ={}
# game_hash.each do |location, team_data|
#   #location is just home or away, team_data is all the data for home
#   team_data.each do |attribute, data|
#     #attribute goes thru team name, colors and players to get their values
#     #for team name, will get brooklyn or the other
#     #  for colors will get the array of colors
#     #for players will get whole hash, player name and all their stats
#       if attribute == :players
#         data.each do |data_item, stat_list|
#         # data_item would be player name, gets entire hash of stats for values
#           if data_item == name_of_player
#             return stat_list
#             # stat_list.each do |stat, value|
#             #   #looks into stats hash
#             #   #these are all the names of stats and all their values
#             #   if name == name_of_player
#             #     statistics[stat] = value
#             #end
#           end
#         end
#       end
#    end
#   #statistics
# end








#none of this worked
#?
# def player_numbers(name_of_team)
#   jersey_array = []
#   game_hash.each do |location, team_data|
#     #location is just home or away, team_data is all the data for home

#       team_data.each do |attribute, data|
#         #attribute goes thru team name, colors and players to get their values
#         #for team name, will get brooklyn or the other
#         #  for colors will get the array of colors
#         #for players will get whole hash, player name and all their s
          #if data == name_of-team
#         this was a problem as can't loop thru string  and name_of -team is a string
#           data.each do |data_item, stat_list|
#             # data_item would be player name, gets entire hash of stats for values
#             stat_list.each do |stat, value|
#               #looks into stats hash
#               #these are all the names of stats and all their values
#               if stat == :number
#                 jersey_array.push(value)
#               end
#             end
#           end
#         end
#       end
#     end
#   jersey_array
# end
