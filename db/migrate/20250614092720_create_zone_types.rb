class CreateZoneTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :zone_types do |t|
      t.string :land_name, limit: 20, null: false
      t.integer :def_max_speed, null: false
      t.integer :def_min_speed, null: false
      t.text :description
      t.timestamps
      t.datetime :upgraded_at
      t.datetime :deleted_at
    end
  end
end