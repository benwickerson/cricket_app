class PlayerCountryFix < ActiveRecord::Migration
  def change
    rename_column :players, :country_of_birth, :country_id
  end
end
