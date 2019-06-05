class SlackGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :slack_groups, id: :uuid do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
