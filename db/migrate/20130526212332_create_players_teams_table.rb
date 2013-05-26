class CreatePlayersTeamsTable < ActiveRecord::Migration
  def self.up
    create_table :players_teams, :id => false do |t|
        t.references :player
        t.references :team
    end
    add_index :players_teams, [:player_id, :team_id]
    add_index :players_teams, [:team_id, :player_id]
  end

  def self.down
    drop_table :players_teams
  end
end