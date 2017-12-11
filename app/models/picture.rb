class Picture < ApplicationRecord
  belongs_to :category

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy

  mount_uploader :img, ImageUploader

  delegate :user, to: :category

end
