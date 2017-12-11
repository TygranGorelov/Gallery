class RemoveFildFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :category_id, :integer
  end
end
