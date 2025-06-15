# WARNING: This seed file will delete existing records for the following models.
# Use with caution in a safe test environment.
ActiveRecord::Base.transaction do
  ZoneType.delete_all
  Zone.delete_all
  RoadType.delete_all
  Road.delete_all
  Camera.delete_all
  Vehicle.delete_all
  Monitoring.delete_all

  # Create several RoadTypes
  road_types = []
  road_types << RoadType.create!(
    def_max_speed: 80,
    def_min_speed: 40,
    width_def: 8.0,
    line_count_def: 2,
    is_one_way_def: false,
    description: "Urban road"
  )
  road_types << RoadType.create!(
    def_max_speed: 100,
    def_min_speed: 60,
    width_def: 10.0,
    line_count_def: 3,
    is_one_way_def: false,
    description: "Highway"
  )
  road_types << RoadType.create!(
    def_max_speed: 60,
    def_min_speed: 30,
    width_def: 7.5,
    line_count_def: 2,
    is_one_way_def: true,
    description: "Rural road"
  )

  # Create ZoneTypes with specified land names.
  zone_types = []
  zone_types << ZoneType.create!(
    land_name: "Educational",
    def_max_speed: 40,
    def_min_speed: 20,
    description: "Educational areas and campuses"
  )
  zone_types << ZoneType.create!(
    land_name: "Hospital",
    def_max_speed: 50,
    def_min_speed: 30,
    description: "Medical and hospital zones"
  )
  zone_types << ZoneType.create!(
    land_name: "Residential",
    def_max_speed: 50,
    def_min_speed: 30,
    description: "Residential areas"
  )
  zone_types << ZoneType.create!(
    land_name: "Commercial",
    def_max_speed: 60,
    def_min_speed: 30,
    description: "Business and commercial areas"
  )
  zone_types << ZoneType.create!(
    land_name: "Industrial",
    def_max_speed: 70,
    def_min_speed: 40,
    description: "Industrial regions"
  )
  zone_types << ZoneType.create!(
    land_name: "Recreational",
    def_max_speed: 45,
    def_min_speed: 25,
    description: "Parks and recreational areas"
  )

  # Create around 30 Zones, each assigned a random ZoneType from above.
  zones = []
  30.times do
    random_zone_type = zone_types.sample
    zones << Zone.create!(zone_type: random_zone_type)
  end

  # Create 10 Roads associating RoadTypes and Zones.
  roads = []
  10.times do
    roads << Road.create!(
      road_type: road_types.sample,
      zone: zones.sample
    )
  end

  # Create 20 Cameras, each attached to a random road.
  cameras = []
  20.times do
    cameras << Camera.create!(
      road: roads.sample,
      range: rand(10..50),
      camera_status: ["active", "inactive"].sample,
      camera_type: ["speed", "red_light", "surveillance"].sample,
      x_position: rand * 100,
      y_position: rand * 100,
      angle: rand * 360
    )
  end

  # Helper method to generate an Iranian-style vehicle plate.
  # Format: "xx A xxx xx" where:
  # - "xx" is two digits (10-99),
  # - "A" is an uppercase alphabetic character,
  # - "xxx" is three digits (100-999),
  # - "xx" is two digits (10-99).
  def generate_plate
    two_digits_1 = rand(10..99)
    letter = ('A'..'Z').to_a.sample
    three_digits = rand(100..999)
    two_digits_2 = rand(10..99)
    "#{two_digits_1} #{letter} #{three_digits} #{two_digits_2}"
  end

  # Create 15 Vehicles with the Iranian plate format.
  vehicles = []
  15.times do
    vehicles << Vehicle.create!(
      veh_plate: generate_plate,
      veh_color: ["red", "blue", "green", "black", "white"].sample,
      veh_type: ["car", "truck", "motorcycle"].sample,
      veh_create_date: Date.today - rand(1..365),
      veh_pollution_lvl: ["A+", "A", "A-"].sample,
      veh_fuel_type: ["gas", "diesel", "electric" , "hybrid"].sample
    )
  end

  # Create 25 Monitors which link Cameras and Vehicles.
  monitorings = []
  25.times do
    monitorings << Monitoring.create!(
      camera: cameras.sample,
      veh_plate: vehicles.sample.veh_plate,
      time: Time.now - rand(0..3600),
      line: rand(1..3)
    )
  end

  puts "Seed finished successfully!"
  puts "Created #{RoadType.count} RoadTypes"
  puts "Created #{ZoneType.count} ZoneTypes"
  puts "Created #{Zone.count} Zones"
  puts "Created #{Road.count} Roads"
  puts "Created #{Camera.count} Cameras"
  puts "Created #{Vehicle.count} Vehicles"
  puts "Created #{Monitoring.count} Monitors"
end