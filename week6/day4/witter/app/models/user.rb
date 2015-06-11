class User < ActiveRecord::Base
  has_secure_password
  has_many :wits

  def self.select_users
    all.map { |user| [user.email, user.id] }
  end
end
