class AddChannelIdToSlackGroups < ActiveRecord::Migration[5.2]
  def change
  	add_column :slack_groups, :slack_channel_id, :string, index: true
  end
end
