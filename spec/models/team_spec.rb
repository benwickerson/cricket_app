# == Schema Information
#
# Table name: teams
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  country_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#  user_id        :integer
#  home_ground_id :integer
#

require 'spec_helper'

describe Team do
  
  before do
    @team = Team.new(name: "England", country_id: 1, user_id: 1)
  end

  it { should respond_to(:name) }
  it { should respond_to(:country_id) }
  it { should respond_to(:user_id) }

end
