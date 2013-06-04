class RenameHomeGroundIdToGroundId < ActiveRecord::Migration
  def change
    rename_column :teams, :home_ground_id, :ground_id
  end
end
