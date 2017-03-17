class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  validates :rating, presence: true
end
