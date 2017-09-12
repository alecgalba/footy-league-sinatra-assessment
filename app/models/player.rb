class Player < ActiveRecord::Base
  has_secure_password
  has_many :teams
  has_many :leagues, through: :teams

end
