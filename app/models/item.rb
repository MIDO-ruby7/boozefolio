class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :photos, dependent: :destroy
  mount_uploader :image, BoozeImageUploader
  accepts_nested_attributes_for :photos, allow_destroy: true

  def process_image(image)
    resized_image = resize_image(image)
    webp_data = convert_to_webp(resized_image)
    photos.create(image: webp_data)
  end

  def resize_image(image)
    magick_image = Magick::Image.read(image.path).first
    magick_image.resize_to_fit(800, 600)
  end

  def convert_to_webp(image)
    image.to_blob { |i| i.format = 'webp' }
  end
end
