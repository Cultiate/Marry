class ChangeColumnsToCelebraters < ActiveRecord::Migration[5.1]
  def change
    # change_column :celebraters, :user_id, 'integer USING CAST(user_id AS integer)'
    # change_column :celebraters, :project_id, 'integer USING CAST(project_id AS integer)'
    # change_column :celebraters, :return_id, 'integer USING CAST(return_id AS integer)'
    # change_column :celebraters, :return_price, 'integer USING CAST(return_price AS integer)'
  end
end
