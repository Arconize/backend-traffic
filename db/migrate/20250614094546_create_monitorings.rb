class CreateMonitorings < ActiveRecord::Migration[7.0]
  def change
    create_table :monitors, primary_key: [:camera_id, :veh_plate, :time] do |t|
      t.references :camera, null: false, foreign_key: true
      t.string :veh_plate, null: false, limit: 8
      t.datetime :time, null: false
      t.integer :line
    end

    add_foreign_key :monitors, :vehicles,
                    column: :veh_plate,
                    primary_key: :veh_plate,
                    type: :string, limit: 8
  end
end