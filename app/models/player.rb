class Player < ActiveRecord::Base
  belongs_to :country
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :dob, presence: true
  validates :country, presence: true
  
end
