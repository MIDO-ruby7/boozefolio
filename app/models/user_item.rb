class UserItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :photos, through: :item
end
