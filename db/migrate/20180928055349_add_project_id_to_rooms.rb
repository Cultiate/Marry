class AddProjectIdToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :project_id, :integer
  end
end
