# == Schema Information
#
# Table name: grounds
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :text
#  country_id :integer
#  capacity   :integer
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Ground < ActiveRecord::Base
  belongs_to :country
  has_many :teams

  validates :name, presence: true

end
