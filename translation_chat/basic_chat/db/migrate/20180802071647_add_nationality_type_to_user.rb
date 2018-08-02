class AddNationalityTypeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nationality_type, :string
  end
end
