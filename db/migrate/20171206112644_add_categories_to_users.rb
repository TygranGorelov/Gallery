class AddCategoriesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :category_id, :integer
  end
end
