class CreateEventsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :events, id: :uuid do |t|
      t.belongs_to :slack_group, index: true, foreign_key: true, type: :uuid
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
