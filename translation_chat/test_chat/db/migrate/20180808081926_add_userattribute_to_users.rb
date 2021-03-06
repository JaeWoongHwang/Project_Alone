class AddUserattributeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :nationality, :string
    add_column :users, :gender, :string
    add_column :users, :admin, :boolean, default: false
  end
end
