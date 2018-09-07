class ChangeColumnToProjects < ActiveRecord::Migration[5.1]
  def change
    change_column_default :projects, :display, false
    change_column_null :projects, :display, false
  end
end
