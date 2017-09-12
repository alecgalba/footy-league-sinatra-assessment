class Player < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email, :password_digest, :name
  has_many :teams
  has_many :leagues, through: :teams

end
