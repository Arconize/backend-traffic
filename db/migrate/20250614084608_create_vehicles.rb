class CreateVehicles < ActiveRecord::Migration[8.0]
  def change
    create_table :vehicles, id: false do |t|
      t.string :veh_plate, primary_key: true, limit: 8
      t.string :veh_color, limit: 6, null: false
      t.string :veh_type, limit: 20, null: false
      t.date :veh_create_date, null: false
      t.string :veh_pollution_lvl, null: false
      t.string :veh_fuel_type, null: false
      t.timestamps
      t.datetime :upgraded_at
      t.datetime :deleted_at
    end
  end
end