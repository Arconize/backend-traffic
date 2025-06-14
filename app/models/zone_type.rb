class ZoneType < ApplicationRecord
  self.primary_key = :zone_type_id

  has_many :zones, foreign_key: :zone_type_id

  validates :land_name, presence: true, length: { maximum: 20 }
  validates :def_max_speed, presence: true, numericality: { only_integer: true }
  validates :def_min_speed, presence: true, numericality: { only_integer: true }
end