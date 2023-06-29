class Item < ApplicationRecord
  require "mini_magick"
  belongs_to :user
  belongs_to :category, optional: true
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :name, presence: true, uniqueness: true

  mount_uploader :image, BoozeImageUploader

  enum country_of_origin: {
    ar: 32, au: 36, at: 40, be: 56, bz: 84,
    mm:104, ca: 124, lk: 144, cn: 156, tw:158, co: 170, hr: 191, cu: 192,
    cz: 203, dk: 208, sv: 222, ee: 233, fi: 246, fr: 250, pf: 258, ge: 268,
    gr: 300, gt: 320, hn: 340, hu: 348, in: 356, ie: 372, il: 376, it: 380, jm: 388, jp: 392,
    ke: 404, kr: 410, lv: 428, lt: 440, lu: 442, mo: 446 , my: 458, mu: 480, mx: 484,
    na:516, nl: 528, aw: 533, nz: 554, ni: 558, no: 578, pa: 591,
    py: 600, pe: 604, ph: 608, pl: 616, pt: 620, ru: 643, sl: 694,
    sk: 703, vn:704, es: 724, se: 752, ch: 756, th: 764,
    mk: 807 ,eg: 818, gb: 826, us: 840,
    England: 8261,
  }
  def process_image(image_data)
    photos.create(image: image_data)
  end
end
