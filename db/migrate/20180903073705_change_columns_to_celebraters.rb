class ChangeColumnsToCelebraters < ActiveRecord::Migration[5.1]
  def change
    change_column :celebraters, :user_id, 'integer USING CAST(column_name AS integer)'
    change_column :celebraters, :project_id, 'integer USING CAST(column_name AS integer)'
    change_column :celebraters, :return_id, 'integer USING CAST(column_name AS integer)'
    change_column :celebraters, :return_price, 'integer USING CAST(column_name AS integer)'
  end
end
