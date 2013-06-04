class AddHomeGroundIdToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :home_ground_id, :integer
  end
end
