class MessageStampRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :stamp
  belongs_to :message, optional: true

  validates :user_id, uniqueness: { scope: [:message_id, :stamp_id] }

  def self.stamp_count_for_message(message_id)
    result = MessageStampRelationship.where(message_id: message_id).group(:stamp_id).count
  end
end
