class Add < ActiveRecord::Migration
  def change
    add_index :memberships, [:user_id, :petition_id], unique: true
  end
end
