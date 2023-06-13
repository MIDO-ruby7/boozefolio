class Item < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  mount_uploader :image, BoozeImageUploader
  accepts_nested_attributes_for :photos, allow_destroy: true
end
