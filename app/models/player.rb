class Player < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email, :password_digest, :name
  has_many :teams
  has_many :leagues, through: :teams

  def slug
    self.username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find{|a| a.slug == slug}
  end

end
