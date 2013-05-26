class ChangeTeamCountryColumnName < ActiveRecord::Migration
  def change
    rename_column :teams, :country, :country_id
  end
end
