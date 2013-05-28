class CreateSpecialisms < ActiveRecord::Migration
  def change
    create_table :specialisms do |t|
      t.text :specialism

      t.timestamps
    end
  end
end
