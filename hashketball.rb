require "pry"

def game_hash
  game_hash =
  {
    :home=>{
      :team_name=>"Brooklyn Nets",
      :colors=>["Black", "White"],
      :players=>{
        "Alan Anderson"=>{:number=>0,:shoe=>16,:points=>22,:rebounds=>12,:assists=>12,:steals=>3,:blocks=>1,:slam_dunks=>1},
        "Reggie Evans"=>{:number=>30,:shoe=>14,:points=>12,:rebounds=>12,:assists=>12,:steals=>12,:blocks=>12,:slam_dunks=>7},
        "Brook Lopez"=>{:number=>11,:shoe=>17,:points=>17,:rebounds=>19,:assists=>10,:steals=>3,:blocks=>1,:slam_dunks=>15},
        "Mason Plumlee"=>{:number=>1,:shoe=>19,:points=>26,:rebounds=>12,:assists=>6,:steals=>3,:blocks=>8,:slam_dunks=>5},
        "Jason Terry"=>{:number=>31,:shoe=>15,:points=>19,:rebounds=>2,:assists=>2,:steals=>4,:blocks=>11,:slam_dunks=>1}
      }
    },
    :away=>{
      :team_name=>"Charlotte Hornets",
      :colors=>["Turquoise", "Purple"],
      :players=>{
        "Jeff Adrien"=>{:number=>4,:shoe=>18,:points=>10,:rebounds=>1,:assists=>1,:steals=>2,:blocks=>7,:slam_dunks=>2},
        "Bismak Biyombo"=>{:number=>0,:shoe=>16,:points=>12,:rebounds=>4,:assists=>7,:steals=>7,:blocks=>15,:slam_dunks=>10},
        "DeSagna Diop"=>{:number=>2,:shoe=>14,:points=>24,:rebounds=>12,:assists=>12,:steals=>4,:blocks=>5,:slam_dunks=>5},
        "Ben Gordon"=>{:number=>8,:shoe=>15,:points=>33,:rebounds=>3,:assists=>2,:steals=>1,:blocks=>1,:slam_dunks=>0},
        "Brendan Haywood"=>{:number=>33,:shoe=>15,:points=>6,:rebounds=>12,:assists=>12,:steals=>22,:blocks=>5,:slam_dunks=>12}
      }
    }
  }
end

def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data.each do |info, data|
      if info == :players
        data.each do |player_name, attributes|
          if player_name == name
            attributes.each do |key, value|
              if key == :points
                return value
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data.each do |info, data|
      if info == :players
        data.each do |player_name, attributes|
          if player_name == name
            attributes.each do |key, value|
              if key == :shoe
                return value
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |info, data|
      if game_hash[location][info] == team_name
        return game_hash[location][:colors]
      end
    end
  end
end

def team_names
  result = []
  game_hash.each do |location, team_data|
    team_data.each do |info, data|
      if info == :team_name
        result << game_hash[location][:team_name]
      end
    end
  end
  result
end

def player_numbers(team_name)
  result = []
  game_hash.each do |location, team_data|
    team_data.each do |info, data|
      if game_hash[location][info] == team_name
        players_hash = game_hash[location][:players]
        players_hash.each do |attributes, data|
          result << data[:number]
        end
      end
    end
  end
  result
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data.each do |info, data|
      if info == :players
        data.each do |player_name, attributes|
          if player_name == name
            return attributes
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  players = home_players.merge(away_players)
  shoe_size = []
  shoe_owner = []

  players.each do |name, stats|
    shoe_size << stats[:shoe]
    shoe_owner << name
  end

  big_shoe = shoe_owner[shoe_size.rindex(shoe_size.max)]
  players[big_shoe][:rebounds]
end

def most_points_scored
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  players = home_players.merge(away_players)
  points_count = []
  points_owner = []

  players.each do |name, stats|
    points_count << stats[:points]
    points_owner << name
  end

  big_count = points_owner[points_count.rindex(points_count.max)]
end

def winning_team
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  brooklyn_points = 0
  hornets_points = 0

  home_players.each do |name, stats|
    brooklyn_points += stats[:points]
  end

  away_players.each do |name, stats|
    hornets_points += stats[:points]
  end

  if brooklyn_points > hornets_points
    return "Brooklyn Nets"
  else
    return "Charlotte Hornets"
  end

end

def player_with_longest_name
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  players = home_players.merge(away_players)
  name_count = []
  name_owner = []

  players.each do |name, stats|
    name_count << name.length
    name_owner << name
  end

  long_name = name_owner[name_count.rindex(name_count.max)]
end

def long_name_steals_a_ton?
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  players = home_players.merge(away_players)
  steals_count = []
  steals_owner = []

  players.each do |name, stats|
    steals_count << stats[:steals]
    steals_owner << name
  end

  big_steals = steals_owner[steals_count.rindex(steals_count.max)]

  if big_steals == player_with_longest_name
    return true
  end
  false
end
