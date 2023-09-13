class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_many :items, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :drinking_records, dependent: :destroy
  has_many :user_items, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :message_stamp_relationships, dependent: :destroy
  has_many :stamps, through: :message_stamp_relationships

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def own?(object)
    id == object.user_id
  end

  def stamp(message, stamp)
    message_stamp_relationships.create(message: message, stamp: stamp)
  end

  def cancel_stamp(message, stamp)
    message_stamp_relationships.find_by(message: message, stamp: stamp)&.destroy
  end

  def stamp?(message, stamp)
    message_stamp_relationships.exists?(message: message, stamp: stamp)
  end
end
