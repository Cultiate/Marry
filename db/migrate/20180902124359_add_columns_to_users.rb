class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :follow_project_id, :integer
    add_column :users, :follow_project_return_id, :integer
    add_column :users, :follow_project_return_price, :integer
  end
end
