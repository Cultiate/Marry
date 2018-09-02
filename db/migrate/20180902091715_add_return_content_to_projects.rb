class AddReturnContentToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :return_content, :text
  end
end
