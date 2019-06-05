class AddUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :slack_user_id, null: false
      t.string :slack_username, null: false

      t.timestamps null: false
    end
  end
end
