class AddReturnPriceToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :return_price, :integer
  end
end
