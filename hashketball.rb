def game_hash
  game_hash ={}
  game_hash = {:home=> {
              :team_name=> "Brooklyn Nets",
              :colors =>["Black", "White"],
              :players => {
                            "Alan Anderson" =>
                            {
                              :number => 0,
                              :shoe => 16,
                              :points => 22,
                              :rebounds=> 12,
                              :assists=> 12,
                              :steals=> 3,
                              :blocks=> 1,
                              :slam_dunks => 1
                            },
                            "Reggie Evans" =>
                            {
                             :number => 30,
                             :shoe => 14,
                             :points => 12,
                             :rebounds=> 12,
                             :assists=> 12,
                             :steals=> 12,
                             :blocks=> 12,
                             :slam_dunks => 7
                           },
                           "Brook Lopez" =>
                            {
                              :number => 11,
                              :shoe => 17,
                              :points => 17,
                              :rebounds=> 19,
                              :assists=> 10,
                              :steals=> 3 ,
                              :blocks=> 1,
                              :slam_dunks => 15
                            },
                            "Mason Plumlee" =>
                            {
                              :number => 1,
                              :shoe => 19,
                              :points => 26,
                              :rebounds=> 12,
                              :assists=> 6,
                              :steals=> 3,
                              :blocks=> 8,
                              :slam_dunks => 5
                            },
                            "Jason Terry"=>
                            {
                              :number => 31,
                              :shoe => 15,
                              :points => 19,
                              :rebounds=> 2,
                              :assists=> 2,
                              :steals=> 4,
                              :blocks=> 11,
                              :slam_dunks => 1
                              }
                          }
                      },

              :away => {
              :team_name=> "Charlotte Hornets",
              :colors =>["Turquoise", "Purple"],
              :players =>{
                "Jeff Adrien" =>
                 {
                   :number => 4,
                   :shoe => 18,
                   :points => 10,
                   :rebounds=> 1,
                   :assists=> 1,
                   :steals=> 2,
                   :blocks=> 7,
                   :slam_dunks => 2
                 },
                 "Bismak Biyombo" =>
                  {
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds=> 4,
                    :assists=> 7,
                    :steals=> 7,
                    :blocks=> 15,
                    :slam_dunks => 10
                  },
                  "DeSagna Diop" =>
                  {
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds=> 12,
                    :assists=> 12,
                    :steals=> 4 ,
                    :blocks=> 5,
                    :slam_dunks => 5
                  },
                  "Ben Gordon" =>
                  {
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds=> 3,
                    :assists=> 2,
                    :steals=> 1,
                    :blocks=> 1,
                    :slam_dunks => 0
                  },
                  "Brendan Haywood"=>
                   {
                     :number => 33,
                     :shoe => 15,
                     :points => 6,
                     :rebounds=> 12,
                     :assists=> 12 ,
                     :steals=> 22,
                     :blocks=> 5,
                     :slam_dunks => 12
                    }
                }
          }
    }

end

def num_points_scored(player_name)
    game_hash.each do |original, team|
      stats = team[:players][player_name]
      if stats
        return stats[:points]
      end
    end
end

def shoe_size(player_name)
    game_hash.each do |shoe_size, team|
        if team[:players][player_name]
            return team[:players][player_name][:shoe]
        end
    end
end

def team_colors(team_name)
    that_team_colors = []
    game_hash.each do |original_team, team_attribute|
        if team_attribute[:team_name] == team_name
            that_team_colors << game_hash[original_team][:colors]
        end
    end
    that_team_colors.flatten
end

def team_names
    array_of_team_names = []
    game_hash.each do |original_team, team|
        array_of_team_names << team[:team_name]
    end
    array_of_team_names
end

def player_numbers(team_name)
    jersey_numbers = []
    game_hash.each do |original, team|
        team[:players].each do |name, stats|
            if team[:team_name] == team_name
                jersey_numbers << team[:players][name][:number]
            end
        end
    end
    return jersey_numbers
end

def player_stats(player_name)
    game_hash.each do |original, team|
      stats = team[:players][player_name]
      if stats
          return stats
      end
    end
end

def big_shoe_rebounds
    largest_shoe_size = 0
    rebounds = 0
    player = ""
    game_hash.each do |original, team|
        team[:players].each do |name, stats|
            if largest_shoe_size < shoe_size(name)
                largest_shoe_size = shoe_size(name)
                player = name
            end
        end
    end
    return player_stats(player)[:rebounds]
end

def most_points_scored(team_name)
    players = player_names(team_name)
    most_points = 0
   top_player_name = ""

    players.each do |player|
        if most_points < num_points_scored(player)
            most_points = num_points_scored(player)
            top_player_name = player
        end
    end
    return top_player_name
end

def winning_team(team_name1, team_name2)
    the_winner  = ""
    if total_points_scored(team_name1) > total_points_scored(team_name2)
        the_winner  = team_name1
    else
        the_winner  = team_name2
    end
    return the_winner
end

def player_with_longest_name(team_name)
    players = player_names(team_name)
    new_Length = 0
    longest_name = ""
    players.each do |player|
        if new_Length < player.length
            new_Length = player.length
            longest_name = player
        end
    end
    return longest_name
end
