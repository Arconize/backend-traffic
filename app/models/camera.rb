class Camera < ApplicationRecord
  # Enums
  enum :camera_status, {
    active: "active",
    inactive: "inactive",
    maintenance: "maintenance"
  }, prefix: true

  enum :camera_type, {
    speed: "speed",
    red_light: "red_light",
    surveillance: "surveillance",
    parking: "parking"
  }, prefix: true

  # Associations
  belongs_to :road
  has_many :monitorings, dependent: :destroy
  has_many :vehicles, through: :monitorings

  # Validations
  validates :range, numericality: { greater_than: 0 }
  validates :x_position, :y_position, :angle, numericality: true
  validates :camera_status, :camera_type, presence: true
end
