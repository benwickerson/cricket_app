class TeamMembership < ActiveRecord::Base
  acts_as_list
  belongs_to :team
  belongs_to :player
end
