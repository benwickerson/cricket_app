# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  country_id :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  ground_id  :integer
#

class Team < ActiveRecord::Base
  belongs_to :country
  belongs_to :user
  belongs_to :ground
  has_many :team_memberships
  has_many :players, through: :team_memberships
  accepts_nested_attributes_for :team_memberships

  validates :name, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
  validates :ground_id, presence: true

end
