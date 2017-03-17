class User < ActiveRecord::Base
  has_many :ratings
  validates :username, length: {minimum: 3}, uniqueness: {case_sensitive: false}, presence: true
  validates :password, confirmation: true, presence: true
end
