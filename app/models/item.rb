class Item < ApplicationRecord
  require "mini_magick"
  belongs_to :user
  belongs_to :category, optional: true
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :name, presence: true, uniqueness: true

  mount_uploader :image, BoozeImageUploader

  has_rich_text :content

  def process_image(image_data)
    photos.create(image: image_data)
  end
end
