class CreateSubscribes < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribes do |t|
      t.integer :user_id
      t.integer :category_id
      t.timestamps
    end
  end
end
