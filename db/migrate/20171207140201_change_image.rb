class ChangeImage < ActiveRecord::Migration[5.1]
  def change
    rename_column :pictures, :picture, :img
  end
end
