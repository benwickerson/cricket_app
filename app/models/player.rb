# == Schema Information
#
# Table name: players
#
#  id            :integer          not null, primary key
#  first_name    :string(255)
#  middle_name   :string(255)
#  last_name     :string(255)
#  dob           :date
#  country_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#  specialism_id :integer
#  hand          :string(255)
#  biography     :text
#

class Player < ActiveRecord::Base
  belongs_to :country
  belongs_to :specialism
  has_and_belongs_to_many :teams

  validates :first_name,     presence: true, length: { maximum: 50 }
  validates :last_name,      presence: true, length: { maximum: 50 }
  validates :dob,            presence: true
  validates :country_id,     presence: true
  validates :specialism_id,  presence: true
  validates :hand,           presence: true
# validates :biography,      presence: true
end
