class ChangeSlackGroupModeling < ActiveRecord::Migration[5.2]
  def change
    drop_table :interests_slack_groups

    add_column :slack_groups, :interest, :string, null: false, index: true
  end
end
