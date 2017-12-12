class Category < ActiveRecord::Base

  belongs_to :user

  has_many :pictures, dependent: :destroy

  # has_and_belongs_to_many :followers, class_name: 'User', join_table: 'categories_users'

  has_many :subscribes
  has_many :followers, through: :subscribes, source: :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def subscribed_by?(user)
    
    puts '*******' * 10
    puts user_id
    puts user.id
    puts '*******' * 10

    followers.map(&:id).include?(user.id)
  end
  
end