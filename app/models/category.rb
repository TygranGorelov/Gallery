class Category < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, dependent: :destroy
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end