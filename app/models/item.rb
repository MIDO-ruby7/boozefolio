class Item < ApplicationRecord
  belongs_to :user
  mount_uploader :image, BoozeImageUploader

  def get_item_tags
    
  end
end
