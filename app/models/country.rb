class Country < ActiveRecord::Base
  has_many :teams
  has_many :users
  has_many :players
  validates :name, presence: true, uniqueness: true
end
