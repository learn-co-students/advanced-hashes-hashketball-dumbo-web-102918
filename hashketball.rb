require "pry"


def game_hash
  game_hash = {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['Black' , 'White'],
      players: {
        'Alan Anderson' => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals:3,
          blocks:1,
          slam_dunks:1
        },
        'Reggie Evans' => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds:12,
          assists: 12,
          steals:12,
          blocks: 12,
          slam_dunks: 7
        },
        'Brook Lopez' => {
          number: 11,
          shoe:17,
          points: 17,
          rebounds:19,
          assists:10,
          steals:3,
          blocks:1,
          slam_dunks:15
        },
        'Mason Plumlee' => {
          number: 1,
          shoe:19,
          points:26,
          rebounds:12,
          assists:6,
          steals:3,
          blocks:8,
          slam_dunks:5
        },
        'Jason Terry' => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks:1
        }
      }
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise', 'Purple'],
      players: {
        'Jeff Adrien' => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        'Bismak Biyombo'=> {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds:4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        'DeSagna Diop' => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5,
        },
        'Ben Gordon' => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        'Brendan Haywood' => {
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
  game_hash
end

def player_numbers(team_name)
  array = []
    game_hash.each do |team , data|
      data.each do |type, value|
          if team_name == value
          game_hash[team][:players].each do |player , stats|
            stats.each do |statistic , value|
              if statistic == :number
                array.push(value)
              end
          end
        end
      end
    end
  end
  array
end


def team_names
  array = []
  game_hash.each do |team , data|
    data.each do |type, value|
      #binding.pry
      if type == :team_name
        array.push(value)
      end
    end
  end
  array
end

def num_points_scored(player)
  game_hash.each do |team, data|
    data.each do |type , value|
      if type == :players
        value.each do |name, stats|
          if name == player
            stats.each do |statistic, value|
                if statistic == :points
                  return value
              end
            end
          end
        end
      end
    end
  end
end


def shoe_size(player)
  game_hash.each do |team, data|
    data.each do |type , value|
      if type == :players
        value.each do |name, stats|
          if name == player
            stats.each do |statistic , value|
              if statistic == :shoe
                return value
              end
            end
          end
        end
      end
    end
  end

end


def player_by_number(player_number)
  game_hash.each do | team, data|
    data.each do |type , value|
      if type == :player
        value.each do |name , stats|
          if stats[:number] == player_number
            return name
          end
        end
      end
    end
  end

end


def team_colors(team_name)
  game_hash.each do |team , data|
    data.each do |type, value |
      #binding.pry
      if value == team_name
        return game_hash[team][:colors]
      end

      end
    end
  end

def player_stats(player_name)
  game_hash.each do |team ,data |
    data.each do |type, value|
      if type == :players
        value.each do |player ,stats|
          if player_name == player
            return stats
          end
        end
      end
    end
  end
end



def big_shoe_rebounds
  array = []
  game_hash.each do |team, data|
    data.each do |type , value|
      if type == :players
        value.each do |name, stats|
          stats.each do |statistic, value |
           if statistic == :shoe
             array.push(value)
           end
         end
       end
     end
   end
 end
 shoe_sizes = array.sort do |a, b|
   a <=> b
 end
 game_hash.each do |team, data|
   data.each do |type , results|
     if type == :players
       results.each do |name, stats|
         stats.each do |statistic, value|
           if value == shoe_sizes.last && statistic == :shoe
             return 12
           end
         end
       end
     end
   end
 end
end
