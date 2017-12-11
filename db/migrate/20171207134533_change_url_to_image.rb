class ChangeUrlToImage < ActiveRecord::Migration[5.1]
  def change
    rename_column :pictures, :url, :picture
  end
end
