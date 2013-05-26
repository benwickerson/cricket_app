class Team < ActiveRecord::Base
  belongs_to :country
  validates :name, presence: true, length: { maximum: 50 }
end
