class AddContentToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :content, :text
  end
end
