class AddMainImageToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :main_image, :string
  end
end
