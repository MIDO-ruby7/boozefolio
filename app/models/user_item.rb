class UserItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  delegate :photos, to: :item
end
