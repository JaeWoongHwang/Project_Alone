class AddParentToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :parent, foreign_key: true
  end
end
