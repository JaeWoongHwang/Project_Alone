class AddWinNumToApp < ActiveRecord::Migration[5.2]
  def change
    add_column :apps, :winNum, :string
  end
end
