class Zone < ApplicationRecord
  belongs_to :zone_type, foreign_key: :zone_type_id
  has_many :roads, dependent: :destroy

  validates :zone_type_id, presence: true
end
