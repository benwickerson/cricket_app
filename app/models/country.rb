class Country < ActiveRecord::Base
  has_many :players
  has_many :teams

  validates :name, presence: true, uniqueness: true
end
