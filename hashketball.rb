# Write your code here!
#require 'pry'
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
        "Mason Plumlee" =>
          {
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

def num_points_scored(plyr_nm)
  if game_hash[:home][:players].has_key? plyr_nm
    game_hash[:home][:players][plyr_nm][:points]
  else
    game_hash[:away][:players][plyr_nm][:points]
  end
end

def shoe_size(plyr_nm)
  if game_hash[:home][:players].has_key? plyr_nm
    game_hash[:home][:players][plyr_nm][:shoe]
  else
    game_hash[:away][:players][plyr_nm][:shoe]
  end
end

def get_rebounds(plyr_nm)
  if game_hash[:home][:players].has_key? plyr_nm
    game_hash[:home][:players][plyr_nm][:rebounds]
  else
    game_hash[:away][:players][plyr_nm][:rebounds]
  end
end

def get_points(plyr_nm)
  if game_hash[:home][:players].has_key? plyr_nm
    game_hash[:home][:players][plyr_nm][:points]
  else
    game_hash[:away][:players][plyr_nm][:points]
  end
end

def get_steals(plyr_nm)
  if game_hash[:home][:players].has_key? plyr_nm
    game_hash[:home][:players][plyr_nm][:steals]
  else
    game_hash[:away][:players][plyr_nm][:steals]
  end
end

def team_colors(tm_nm)
  if game_hash[:home][:team_name] == tm_nm
    game_hash[:home][:colors]
  else
    game_hash[:away][:colors]
  end
end

def team_names
  name_of_teams = []
  game_hash.keys.each do |key|
    name_of_teams << game_hash[key.to_sym][:team_name]
  end
  name_of_teams
end

def player_numbers(team_name)
  jrsy_nums = []
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:players].each_key do |key|
      jrsy_nums << game_hash[:home][:players][key][:number]
    end
  else
    game_hash[:away][:players].each_key do |key|
      jrsy_nums << game_hash[:away][:players][key][:number]
    end
  end
  jrsy_nums
end

def player_stats(plyr_nm)
  if game_hash[:home][:players].has_key? plyr_nm
    game_hash[:home][:players][plyr_nm]
  else
    game_hash[:away][:players][plyr_nm]
  end
end

def big_shoe_rebounds
  big_shoe = 0
  big_plyr = ""
  play_arr = []
  game_hash.keys.each do |key|
    play_arr << game_hash[key.to_sym][:players].keys
  end
  play_arr.flatten!
  play_arr.each do |player_nm|
    if shoe_size(player_nm) > big_shoe
      big_shoe = shoe_size(player_nm)
      big_plyr = player_nm
    end
  end
  get_rebounds(big_plyr)
end

def most_points_scored
  most_pnts = 0
  big_plyr = ""
  play_arr = []
  game_hash.keys.each do |key|
    play_arr << game_hash[key.to_sym][:players].keys
  end
  play_arr.flatten!
  play_arr.each do |player_nm|
    if get_points(player_nm) > most_pnts
      most_pnts = get_points(player_nm)
      big_plyr = player_nm
    end
  end
  big_plyr
end

def most_steals
  most_stls = 0
  big_plyr = ""
  play_arr = []
  game_hash.keys.each do |key|
    play_arr << game_hash[key.to_sym][:players].keys
  end
  play_arr.flatten!
  play_arr.each do |player_nm|
    if get_steals(player_nm) > most_stls
      most_pnts = get_steals(player_nm)
      big_plyr = player_nm
    end
  end
  big_plyr
end

def winning_team
  home_total = 0
  away_total = 0
  game_hash[:home][:players].keys.each do |ply_nm|
    home_total += game_hash[:home][:players][ply_nm][:points]
  end
  game_hash[:away][:players].keys.each do |ply_nm|
    home_total += game_hash[:away][:players][ply_nm][:points]
  end
  home_total > away_total ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  play_arr = []
  game_hash.keys.each do |key|
    play_arr << game_hash[key.to_sym][:players].keys
  end
  play_arr.flatten!
  play_arr.sort_by! { |x| x.length }
  play_arr[-1]
end

def long_name_steals_a_ton?
  player_with_longest_name == most_steals ? true : false
end
