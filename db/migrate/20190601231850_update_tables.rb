class UpdateTables < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :team

    add_column :events, :description, :text, null: false
    add_column :events, :image_url, :string
  end
end
