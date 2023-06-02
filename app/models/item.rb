class Item < ApplicationRecord
  belongs_to :user
  has_many :tags, through: :item_tags
  has_many :item_tags, dependent: :destroy
  mount_uploader :image, BoozeImageUploader

  def get_item_tags
  end
end
