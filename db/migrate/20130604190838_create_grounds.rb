class CreateGrounds < ActiveRecord::Migration
  def change
    create_table :grounds do |t|
      t.string :name
      t.text :address
      t.integer :country_id
      t.integer :capacity
      t.string :url

      t.timestamps
    end
  end
end
