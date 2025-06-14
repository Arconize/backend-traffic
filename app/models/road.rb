# app/models/road.rb
class Road < ApplicationRecord
  belongs_to :road_type
  belongs_to :zone, optional: true
  has_many :cameras, dependent: :destroy

  validates :road_type_id,
            presence: true
end