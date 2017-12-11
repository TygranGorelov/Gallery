class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :like
      t.references :picture

      t.timestamps
    end
  end
end
