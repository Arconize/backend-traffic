class Vehicle < ApplicationRecord
  # Associations
  has_many :monitorings, foreign_key: :veh_plate, dependent: :restrict_with_error
  has_many :cameras, through: :monitorings

  # Enums
  enum :veh_type, {
    car: "car",
    motorcycle: "motorcycle",
    truck: "truck",
    bus: "bus",
    van: "van",
    emergency: "emergency"
  }, prefix: :veh_type

  enum :veh_fuel_type, {
    diesel: "diesel",
    electric: "electric",
    hybrid: "hybrid",
    gas: "gas"
  }, prefix: :fuel_type

  enum :veh_pollution_lvl, {
    a_plus: "A+",
    a_regular: "A",
    a_minus: "A-"
  }, prefix: :pollution

  # # Constants
  PLATE_FORMAT ||= /\A[A-Z0-9]{8}\z/
  COLOR_FORMAT ||= /\A[a-zA-Z]+\z/

  # Validations
  validates :veh_plate,
            presence: true,
            length: { is: 8 },
            format: { with: PLATE_FORMAT },
            uniqueness: { case_sensitive: false }

  validates :veh_color,
            presence: true,
            length: { maximum: 6 },
            format: { with: COLOR_FORMAT }

  # validates :veh_create_date,
  #           presence: true,
  #           timeliness: { before: -> { Date.current }, type: :date }

  # Scopes
  scope :by_type, ->(type) { where(veh_type: type) }
  scope :recent, -> { where('veh_create_date >= ?', 1.year.ago) }

  # Callbacks
  before_validation :normalize_plate, if: :veh_plate_changed?
  before_create :set_initial_timestamps

  # Instance Methods
  def age
    ((Date.current - veh_create_date) / 365).floor
  end

  private

  def normalize_plate
    self.veh_plate = veh_plate.to_s.upcase.gsub(/\s+/, "")
  end

  def set_initial_timestamps
    self.created_at ||= Time.current
    self.updated_at ||= Time.current
  end
end