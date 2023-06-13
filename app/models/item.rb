class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :photos, dependent: :destroy
  mount_uploader :image, BoozeImageUploader
  accepts_nested_attributes_for :photos, allow_destroy: true
end
