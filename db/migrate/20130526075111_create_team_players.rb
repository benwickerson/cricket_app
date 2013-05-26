class CreateTeamPlayers < ActiveRecord::Migration
  def change
    create_table :team_players do |t|
      t.integer :team_id
      t.integer :player_id

      t.timestamps
    end
    add_index :team_players, :team_id
    add_index :team_players, :player_id
    add_index :team_players, [:team_id, :player_id], unique: true
  end
end
