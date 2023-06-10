class Item < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
  mount_uploader :image, BoozeImageUploader
end
