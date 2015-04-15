class ChangeStateIdTable < ActiveRecord::Migration
  def change
    change_column :petitions, :state_id, :string, null: false
  end
end
