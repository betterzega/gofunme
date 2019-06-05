class RemoveTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :events
    drop_table :users
  end
end
