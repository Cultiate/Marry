class RemoveColumnsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :follow_project_id, :string
    remove_column :users, :follow_project_return_id, :string
    remove_column :users, :follow_project_return_price, :string
  end
end
