class Item < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  mount_uploader :image, BoozeImageUploader
end
