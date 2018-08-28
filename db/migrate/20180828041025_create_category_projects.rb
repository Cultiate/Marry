class CreateCategoryProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :category_projects do |t|
      t.integer :category_id
      t.integer :project_id

      t.timestamps
    end
  end
end
