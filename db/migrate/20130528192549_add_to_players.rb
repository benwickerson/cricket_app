class AddToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :specialism, :integer
    add_column :players, :hand,       :string
    add_column :players, :biography,  :text
  end
end
