class Message < ApplicationRecord
  belongs_to :user
  has_many :stamps, through: :message_stamps
  has_many :message_stamps, dependent: :destroy

  validates :content, presence: true, length: { maximum: 140 }
end
