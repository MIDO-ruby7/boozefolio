class Message < ApplicationRecord
  belongs_to :user
  has_many :message_stamp_relationships, dependent: :destroy
  has_many :stamps, through: :message_stamp_relationships

  validates :content, presence: true, length: { maximum: 140 }
end
