class Tag < ApplicationRecord
  has_many:items, through: :item_tags
  has_many:item_tags, dependent: :destroy
end
