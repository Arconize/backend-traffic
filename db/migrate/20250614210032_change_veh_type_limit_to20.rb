class ChangeVehTypeLimitTo20 < ActiveRecord::Migration[8.0]
  def change
    change_column :vehicles, :veh_type, :string, limit: 20
  end
end