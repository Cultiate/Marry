class AddProjectIdToEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :project_id, :integer
  end
end
