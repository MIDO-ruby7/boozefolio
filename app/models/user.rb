class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_many :items, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :drinking_records, dependent: :destroy
  has_many :user_items, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
