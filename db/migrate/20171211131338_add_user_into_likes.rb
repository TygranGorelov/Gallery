class AddUserIntoLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :user_id, :integer
  end
end