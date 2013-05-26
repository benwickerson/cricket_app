class Player < ActiveRecord::Base
  belongs_to :country
  has_and_belongs_to_many :teams

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :dob, presence: true
  validates :country_id, presence: true
end
