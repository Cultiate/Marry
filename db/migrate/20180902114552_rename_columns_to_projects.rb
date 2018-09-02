class RenameColumnsToProjects < ActiveRecord::Migration[5.1]
  def change
    rename_column :projects, :return_title, :return_title_1
    rename_column :projects, :return_content, :return_content_1
    rename_column :projects, :return_image1, :return_image_1
    rename_column :projects, :return_price, :return_price_1
  end
end
