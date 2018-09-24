class AddUserInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :postcode, :string
    add_column :users, :prefecture_code, :integer
    add_column :users, :address, :string
    add_column :users, :phonenumber, :string
  end
end
