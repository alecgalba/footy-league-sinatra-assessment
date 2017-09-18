class User < ActiveRecord::Base
  has_many :teams
  has_secure_password

  def slug
    self.username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find{|a| a.slug == slug}
  end
end
