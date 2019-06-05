class CreateInterestsSlackGroupsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table(:interests, :slack_groups, column_options: {type: :uuid})
  end
end
