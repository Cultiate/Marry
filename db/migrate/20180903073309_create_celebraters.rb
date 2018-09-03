class CreateCelebraters < ActiveRecord::Migration[5.1]
  def change
    create_table :celebraters do |t|
      t.string :user_id
      t.string :project_id
      t.string :return_id
      t.string :return_price

      t.timestamps
    end
  end
end
