class CreateRoads < ActiveRecord::Migration[8.0]
  def change
    create_table :roads do |t|
      t.references :road_type, null: false, foreign_key: true
      t.references :zone, null: false, foreign_key: true
      t.datetime :created_at, null: false
      t.datetime :upgraded_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
