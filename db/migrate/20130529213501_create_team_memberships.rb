class CreateTeamMemberships < ActiveRecord::Migration
  def change
    create_table :team_memberships do |t|
      t.integer :team_id
      t.integer :player_id
      t.integer :position
      t.boolean :captain, default: :false
      t.boolean :wicket_keeper, default: :false

      t.timestamps
    end
    add_index :team_memberships, [:player_id, :team_id], unique: true
    add_index :team_memberships, [:team_id, :player_id], unique: true
  end
end
