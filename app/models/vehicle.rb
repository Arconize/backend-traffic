class Vehicle < ApplicationRecord
  # Associations
  has_many :monitorings, foreign_key: :veh_plate, dependent: :restrict_with_error
  has_many :cameras, through: :monitorings

  # Enums
  enum :veh_type, { car: "car", motorcycle: "motorcycle", truck: "truck", bus: "bus", van: "van", emergency: "emergency" }, _prefix: :vehicle
  enum :fuel_type, { petrol: "petrol", diesel: "diesel", electric: "electric", hybrid: "hybrid", gas: "gas" }, _prefix: :fuel
  enum :pollution_lvl, { 'A+': "A+", 'A': "A", 'A-': "A-" }, _prefix: :pollution

  # Validations
  validates :veh_plate,
            presence: true,
            length: { is: 8 },
            format: { with: /\A[A-Z0-9]{8}\z/ },
            uniqueness: { case_sensitive: false }

  validates :veh_color,
            presence: true,
            length: { maximum: 6 },
            format: { with: /\A[a-zA-Z]+\z/ }

  validates :veh_create_date,
            presence: true,
            timeliness: { before: -> { Date.current }, type: :date }

  # Callbacks
  before_validation :normalize_plate, if: :veh_plate_changed?
  before_create :set_initial_timestamps

  private

  def normalize_plate
    self.veh_plate = veh_plate.upcase.gsub(/\s+/, "")
  end

  def set_initial_timestamps
    self.created_at ||= Time.current
    self.updated_at ||= Time.current
  end
end
