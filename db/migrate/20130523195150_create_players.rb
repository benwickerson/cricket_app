class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :dob
      t.integer :country_of_birth

      t.timestamps
    end
  end
end
