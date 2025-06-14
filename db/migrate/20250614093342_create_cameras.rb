class CreateCameras < ActiveRecord::Migration[8.0]
  def change
    create_table :cameras do |t|
      t.integer :range
      t.references :road, null: false, foreign_key: true
      t.string :camera_status
      t.string :camera_type
      t.float :x_position
      t.float :y_position
      t.float :angle
      t.datetime :upgraded_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
