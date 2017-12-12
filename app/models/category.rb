class Category < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_and_belongs_to_many :followers, class_name: 'User', join_table: 'categories_users'
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end