# app/models/road_type.rb
class RoadType < ApplicationRecord
  has_many :roads, dependent: :destroy

  validates :def_max_speed, :def_min_speed,
            numericality: { only_integer: true }

  validates :width_def, :line_count_def,
            numericality: true
end