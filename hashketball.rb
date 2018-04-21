# Write your code here!
require "pry"
def game_hash
  #returns a nested hash
    {
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
end

# binding pry example
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

# def all_players
#   home_team = game_hash[:home][:players]
#   away_team = game_hash[:away][:players]

#   both = home_team + away_team

#   both
# end

def num_points_scored(player_name)
  game_hash[:away][:players].merge(game_hash[:home][:players]).each do |player|
    if player[0] == player_name
      return player[1][:points]
    end
  end
end

def shoe_size(player_name)
  # returns the shoe size of the player
  game_hash[:away][:players].merge(game_hash[:home][:players]).each do |player|
    if player[0] == player_name
      return player[1][:shoe]
    end
  end
end

def team_colors(team_name)
  # returns an array of team colors
  team = game_hash.values.find {|team| team.fetch(:team_name) == team_name}
  team.fetch(:colors)
end

def team_names
  # return an array of the team names
  teams = [game_hash[:home][:team_name], game_hash[:away][:team_name]]
  teams
end

def player_numbers(team_name)
  # returns an array of the jersey numbers for team
  jersey_nums = []
	game_hash.each do |location, loc_data|

		if loc_data[:team_name] == team_name
			loc_data[:players].each do |player, stats|

				jersey_nums << stats[:number]
			end
		end
	end
	jersey_nums
end

def player_stats(player_name)
  # returns a hash of player's player_stats
   game_hash.each do |origin, team|
     stats = team[:players][player_name]
      if stats
          return stats
      end
    end
end


def big_shoe_rebounds
  # return the number of rebounds associated with the player that has the largest shoe size
  largest_shoe = 0
   rebounds = 0
    player = ""
    game_hash.each do |origin, team|
        team[:players].each do |name, stats|
            if largest_shoe < shoe_size(name)
                largest_shoe = shoe_size(name)
                player = name
            end
        end
    end
    return player_stats(player)[:rebounds]
end




# def most_points_scored
#   most_points = 0
#   mvp = ''
#   game_hash.each do |home_away, keys|
#     keys[:players].each do |player|
#       points = player[:points]
#       if points > most_points
#         most_points = points
#         mvp = player[:player_name]
#       end
#     end
#   end
#   mvp
# end

# def winning_team
#   total_points = 0
#   win_team = ''
#   game_hash.each do |home_away, keys|
#   team_points = 0
#     team_name = game_hash[home_away][:team_name]
#     keys[:players].each do |player|
#     points = player[:points]
#       team_points += points
#   end
#     win_team, total_points = team_name, team_points if team_points > total_points
#   end
#   return win_team
# end

# def player_with_longest_name
# players = player_names(team_name)
#     length = 0
#     longest_name = ""
#     players.each do |player|
#         if length < player.length
#             length = player.length
#             longest_name = player
#         end
#     end
#     return longest_name
# end

# def long_name_steals_a_ton?
#   steals_most = ''
#   most_steals = 0
#   game_hash.each do |home_away, keys|
#     keys[:players].each do |player|
#       steals_most, most_steals = player[:player_name], player[:steals] if player[:steals] > most_steals
#     end
#   end
#   return true if steals_most == player_with_longest_name
# end