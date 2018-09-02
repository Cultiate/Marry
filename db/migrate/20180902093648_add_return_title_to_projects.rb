class AddReturnTitleToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :return_title, :string
  end
end
