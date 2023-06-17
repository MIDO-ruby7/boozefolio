class Item < ApplicationRecord
  require "mini_magick"
  belongs_to :user
  belongs_to :category, optional: true
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  mount_uploader :image, BoozeImageUploader

  def process_image(image_data)
    photos.create(image: image_data)
  end
end
