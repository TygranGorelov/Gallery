class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :categories, dependent: :destroy

  has_many :likes, dependent: :destroy

  # has_and_belongs_to_many :followed_categories, class_name: 'Category', join_table: 'categories_users'

  has_many :subscribes
  has_many :followed_categories, through: :subscribes, source: :category

  validates :name, presence: true

  def admin?; end
end
