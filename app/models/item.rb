class Item < ApplicationRecord
  has_paper_trail on: [:update]
  require "mini_magick"
  belongs_to :user
  belongs_to :category, optional: true
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :name, presence: true, uniqueness: true

  mount_uploader :image, BoozeImageUploader

  has_rich_text :content

  enum country_of_origin: {
    AR: 32, AU: 36, AT: 40, BE: 56, BZ: 84,
    MM: 104, CA: 124, LK: 144, CN: 156, TW: 158, CO: 170, HR: 191, CU: 192,
    CZ: 203, DK: 208, SV: 222, EE: 233, FI: 246, FR: 250, PF: 258, GE: 268,
    GR: 300, GT: 320, HN: 340, HU: 348, IN: 356, IE: 372, IL: 376, IT: 380, JM: 388, JP: 392,
    KE: 404, KR: 410, LV: 428, LT: 440, LU: 442, MO: 446, MY: 458, MU: 480, MX: 484,
    NA: 516, NL: 528, AW: 533, NZ: 554, NI: 558, NO: 578, PA: 591,
    PY: 600, PE: 604, PH: 608, PL: 616, PT: 620, RU: 643, SL: 694,
    SK: 703, VN: 704, ES: 724, SE: 752, CH: 756, TH: 764,
    MK: 807, EG: 818, GB: 826, US: 840,
    ENGLAND: 8261
  }

  def process_image(image_data)
    photos.create(image: image_data)
  end
end
