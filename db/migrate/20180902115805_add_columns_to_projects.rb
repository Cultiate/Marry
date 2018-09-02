class AddColumnsToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :return_content_2, :text
    add_column :projects, :return_image_2, :string
    add_column :projects, :return_title_2, :string
    add_column :projects, :return_price_2, :integer

    add_column :projects, :return_content_3, :text
    add_column :projects, :return_image_3, :string
    add_column :projects, :return_title_3, :string
    add_column :projects, :return_price_3, :integer

  end
end
