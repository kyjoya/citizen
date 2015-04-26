class CreateStateWordCounts < ActiveRecord::Migration
  def change
    create_table :state_word_counts do |t|
      t.integer :state_id
      t.string :word
      t.integer :count

      t.timestamps null: false
    end
  end
end
