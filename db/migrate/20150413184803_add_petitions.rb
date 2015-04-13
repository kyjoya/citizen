class AddPetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :image
      t.integer :owner_id, null: false
      t.integer :state_id
    end
  end
end
