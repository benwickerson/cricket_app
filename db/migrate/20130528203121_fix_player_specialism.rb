class FixPlayerSpecialism < ActiveRecord::Migration
  def change
    rename_column :players, :specialism, :specialism_id
  end
end
