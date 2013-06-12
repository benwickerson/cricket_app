# == Schema Information
#
# Table name: team_memberships
#
#  id            :integer          not null, primary key
#  team_id       :integer
#  player_id     :integer
#  position      :integer
#  captain       :boolean          default(FALSE)
#  wicket_keeper :boolean          default(FALSE)
#  created_at    :datetime
#  updated_at    :datetime
#

class TeamMembership < ActiveRecord::Base
  acts_as_list scope: :team_id
  belongs_to :team
  belongs_to :player
end
