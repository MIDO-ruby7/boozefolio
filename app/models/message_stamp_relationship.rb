class MessageStampRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :stamp
  belongs_to :message, optional: true

  validates :user_id, uniqueness: { scope: [:message_id, :stamp_id] }
end
