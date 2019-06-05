class CreateLeadersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :leaders, id: :uuid do |t|
      t.belongs_to :slack_group, index: true, foreign_key: true, type: :uuid
      t.belongs_to :user, index: true, foreign_key: true, type: :uuid

      t.timestamps null: false
    end
  end
end
