class User < ActiveRecord::Base
  has_secure_password
  has_many :dogs
  has_many :successes

  validates :name, presence: true, :on => :create, length: { minimum: 2 }
  validates :password, presence: true, :on => :create, length: { minimum: 8 }
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

end
