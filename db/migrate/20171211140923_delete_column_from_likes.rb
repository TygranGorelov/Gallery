class DeleteColumnFromLikes < ActiveRecord::Migration[5.1]
  def change
    remove_column :likes, :like, :integer
  end
end
