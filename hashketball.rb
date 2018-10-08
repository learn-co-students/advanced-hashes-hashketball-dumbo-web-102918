require "pry"

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets", 
      colors: ["Black","White"], 
      players: {
        "Alan Anderson": {
            number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12,
            assists: 12,
            steals: 3,
            blocks: 1,
            slam_dunks: 1
          },
        "Reggie Evans": {
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7
          },
        "Brook Lopez": {
            number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19,
            assists: 10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15
          },
        "Mason Plumlee": {
            number: 1,
            shoe: 19,
            points: 26,
            rebounds: 12,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5
          },
        "Jason Terry": {
            number: 31,
            shoe: 15,
            points: 19,
            rebounds: 2,
            assists: 2,
            steals: 4,
            blocks: 11,
            slam_dunks: 1
          }
        
        }
  
      },
      
    away:{
      team_name: "Charlotte Hornets", 
      colors: ["Turquoise","Purple"], 
      players: {
        "Jeff Adrien": {
            number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2
          },
        "Bismak Biyombo": {
            number: 0,
            shoe: 16,
            points: 12,
            rebounds: 4,
            assists: 7,
            steals: 7,
            blocks: 15,
            slam_dunks: 10
          },
        "DeSagna Diop": {
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5 
          },
        "Ben Gordon": {
            number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3,
            assists: 2,
            steals: 1,
            blocks: 1,
            slam_dunks: 0
          },
        "Brendan Haywood": {
            number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12,
            assists: 12,
            steals: 22,
            blocks: 5,
            slam_dunks: 12
          }
        
        }
  
      }
  }
end

def num_points_scored (name)
  points = 0
  game_hash.each do |key,val|
    val[:players].each do |inkey,inval|
      if inkey.to_s == name
        points = inval[:points]
      end
    end 
  end 
  return points
end

def shoe_size (name)
  size = 0
  game_hash.each do |key,val|
    val[:players].each do |inkey,inval|
      if inkey.to_s == name
        size = inval[:shoe]
      end
    end 
  end 
  return size
end

def team_colors(name)
  game_hash.each do |key,val|
    if val[:team_name].to_s == name
      return val[:colors]
    end
  end
end 

def team_names
  array = []
  game_hash.each do |key,val|
    array.push(val[:team_name])
  end
  return array
end

def player_numbers (name)
  array = []
  game_hash.each do |key,val|
    if val[:team_name].to_s == name
      val[:players].each do |inkey,inval|
        array.push(inval[:number])
      end
    end 
  end 
  return array
end

def player_stats (name)
  stats = {}
  game_hash.each do |key,val|
    val[:players].each do |inkey,inval|
      if inkey.to_s == name
        stats = inval
      end
    end 
  end 
  return stats
end

def big_shoe_rebounds
 biggest = 0
 reb = 0 
  game_hash.each do |key,val|
    val[:players].each do |inkey,inval|
      if inval[:shoe] > biggest
        biggest = inval[:shoe]
        reb = inval[:rebounds]
      end
    end 
  end 
  return reb
end 

def most_points_scored
  most = 0
  player = ""
  game_hash.each do |key,val|
    val[:players].each do |inkey,inval|
      if inval[:points] > most
        most = inval[:points]
        player = inkey.to_s
      end 
    end 
  end
  return player
end

def winning_team
  total1=0 
  total2=0 
  game_hash.each do |key,val|
    val[:players].each do |inkey,inval|
      if key == :home
        total1 += inval[:points]
      else
        total2 += inval[:points]
      end 
    end 
  end
  if total1>total2
    return game_hash[:home][:team_name].to_s
  else
    return game_hash[:away][:team_name].to_s
  end
end

def player_with_longest_name
  player = ""
  game_hash.each do |key,val|
    val[:players].each do |inkey,inval|
      if inkey.to_s.length > player.length
        player = inkey.to_s
      end 
    end 
  end
  return player
end

def most_steals
steals = 0
  player = ""
  game_hash.each do |key,val|
    val[:players].each do |inkey,inval|
      if inval[:steals] > steals
        steals = inval[:steals]
        player = inkey.to_s
      end 
    end 
  end
  return player
end

def long_name_steals_a_ton?
  if most_steals == player_with_longest_name
    return true
  else
    return false
  end
end 

#def good_practices
#  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#    binding.pry
#      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#        binding.pry
 
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#        data.each do |data_item|
#            binding.pry
#      end
#    end
#  end
#end

#good_practices






