require "pry"

def game_hash

  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
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
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
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

game_hash.each do |home_away, genteam_info|
  game_hash.keys
  game_hash.values
end
end

#Second Problem
def num_points_scored(player_name)

  game_hash.each do |location, team_data|

    team_data[:players].each do |name, data|
      if name == player_name
       return team_data[:players][player_name][:points]
     end
    end
  end

end


#Third Problem
def shoe_size(player_name)

  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      if name == player_name
       return team_data[:players][player_name][:shoe]
     end
    end
  end

end


#Fourth Problem
def team_colors(team_name)

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        return team_data[:colors]
      end
    end
  end
end

#Fifth Problem
def team_names
  game_hash.map do |location, team_data|
    team_data[:team_name]
  end

end


#Sixth Problem
def player_numbers(team_name)
array = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |name, attribute|
        array << attribute[:number]
      end
    end
  end
array
end

#Seventh Problem
def player_stats(players_name)

  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      if name == players_name
        return data
      end
    end
  end

end

#player_stats("Mason Plumlee")

#Eigth Problem
def big_shoe_rebounds
  i = 0

  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      if i == 0 || data[:shoe] > i
        i = data[:shoe]
        #binding.pry
      end
    end
  end

  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      if data[:shoe] == i
        return data[:rebounds]
      end
    end
  end
end

#big_shoe_rebounds
#BONUS!!!!!! SECTION!!!!!# Write your code here!


def most_points_scored
  i = 1
  most = ""

  game_hash.each do |location, team_data|
    team_data[:players].each do |name, attribute|
      if i == 0 || attribute[:points] > i
        i = attribute[:points]
        most = name
      end
    end
  end
most
end

def winning_team
home_points = []
away_points = []

  game_hash[:home][:players].map do |name, attribute|
    home_points << attribute[:points]
  end
home = home_points.inject {|sum, x| sum + x}


  game_hash[:away][:players].map do |name, attribute|
    away_points << attribute[:points]
  end
away = away_points.inject {|sum, x| sum + x}

winner = (home > away ? game_hash[:home][:team_name]: game_hash[:away][:team_name])
winner
end

def player_with_longest_name
i = 0
his_name = ""

  game_hash.each do |location, team_data|
    team_data[:players].each do |name, attribute|
      if i == 0 || name.length > i
        i = name.length
        his_name = name
      end
    end
  end
 his_name
end
