class League < ActiveRecord::Base
  has_many :league_teams
  has_many :users, through: :league_teams
  has_many :teams
end
