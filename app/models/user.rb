class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_many :items, dependent: :destroy
  has_many :photos, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
