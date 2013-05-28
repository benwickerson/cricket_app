# == Schema Information
#
# Table name: specialisms
#
#  id         :integer          not null, primary key
#  specialism :text
#  created_at :datetime
#  updated_at :datetime
#

class Specialism < ActiveRecord::Base
  has_many :players
end
