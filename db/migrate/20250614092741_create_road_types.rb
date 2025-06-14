class CreateRoadTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :road_types do |t|
      t.integer :def_max_speed
      t.integer :def_min_speed
      t.float :width_def
      t.integer :line_count_def
      t.boolean :is_one_way_def
      t.text :description
      t.datetime :upgraded_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
