class Player < ActiveRecord::Base
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :dob, presence: true
  validates :country_of_birth, presence: true
  
end
