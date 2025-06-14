class Monitoring < ApplicationRecord
  self.primary_key = [:camera_id, :veh_plate, :time]

  belongs_to :camera
  belongs_to :vehicle, foreign_key: :veh_plate, primary_key: :veh_plate
  validates :time,
            presence: true

  validates :line,
            numericality: { only_integer: true, greater_than: 0 },
            allow_nil: true
end