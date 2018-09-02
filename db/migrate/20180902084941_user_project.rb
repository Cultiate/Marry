class UserProject < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_projects
  end
end
