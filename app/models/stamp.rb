class Stamp < ApplicationRecord
  has_many :messages, through: :message_stamps
  has_many :message_stamps, dependent: :destroy
  has_many :user_stamps, dependent: :destroy
  has_many :users, through: :user_stamps
end
