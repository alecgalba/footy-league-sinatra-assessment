class League < ActiveRecord::Base
  has_many :players, through: :teams
  has_many :teams
end
