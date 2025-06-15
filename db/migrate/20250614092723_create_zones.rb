class CreateZones < ActiveRecord::Migration[8.0]
  def change
    create_table :zones do |t|
      t.references :zone_type, null: false, foreign_key: true
      t.date :created_at, null: false
      t.datetime :upgraded_at
      t.datetime :deleted_at
      t.timestamps
    end
  end
end