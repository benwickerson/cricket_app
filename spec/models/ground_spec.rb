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

require 'spec_helper'

describe Ground do
  pending "add some examples to (or delete) #{__FILE__}"
end
