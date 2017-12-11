class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :categories, [:user_id, :created_at]
  end
end
