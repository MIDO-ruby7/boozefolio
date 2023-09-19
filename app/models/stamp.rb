class Stamp < ApplicationRecord
  mount_uploader :image, StampImageUploader
  has_many :message_stamp_relationships, dependent: :destroy
  has_many :users, through: :message_stamp_relationships
  has_many :messages, through: :message_stamp_relationships

  validates :name, presence: true, uniqueness: true
  validates :image, presence: true
  validate :name_contains_only_lowercase_letters
  validate :validate_record_count, on: :create

  private

  def name_contains_only_lowercase_letters
    unless name.match(/\A[a-z]+\z/)
      errors.add(:name, "はアルファベット小文字のみ許可されています")
    end
  end

  def validate_record_count
    if Stamp.count >= 100
      errors.add(:base, "スタンプのレコード数は100個までです")
    end
  end
end
