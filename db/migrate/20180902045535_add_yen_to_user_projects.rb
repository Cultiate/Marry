class AddYenToUserProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :user_projects, :yen, :integer
  end
end
