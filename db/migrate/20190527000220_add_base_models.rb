class AddBaseModels < ActiveRecord::Migration[5.2]
  def change
    create_table :events, id: :uuid do |t|
      t.uuid :creator_id, null: false, index: true
      t.string :title, null: false
      t.datetime :start_at, null: false, index: true
      t.datetime :end_at

      t.timestamps null: false
    end

    add_foreign_key :events, :users, column: :creator_id
  end
end
