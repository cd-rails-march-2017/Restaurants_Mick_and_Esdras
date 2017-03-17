class Restaurant < ActiveRecord::Base
  has_many :ratings
  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
