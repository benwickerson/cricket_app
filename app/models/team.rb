class Team < ActiveRecord::Base
  belongs_to :country
  belongs_to :user
  has_and_belongs_to_many :players

  validates :name, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
end
