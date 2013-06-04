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

require 'spec_helper'

describe TeamMembership do
  pending "add some examples to (or delete) #{__FILE__}"
end
