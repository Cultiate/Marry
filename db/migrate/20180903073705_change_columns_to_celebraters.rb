class ChangeColumnsToCelebraters < ActiveRecord::Migration[5.1]
  def change
    change_column :celebraters, :user_id, :integer
    change_column :celebraters, :project_id, :integer
    change_column :celebraters, :return_id, :integer
    change_column :celebraters, :return_price, :integer
  end
end
