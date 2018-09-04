class AddUserNameColumnToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :user_name, :string
  end
end
