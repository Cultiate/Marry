class AddReturnImage1ToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :return_image1, :string
  end
end
