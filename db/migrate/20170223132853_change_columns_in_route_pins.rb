class ChangeColumnsInRoutePins < ActiveRecord::Migration[5.0]
  def change
    change_column :route_pins, :lat, :decimal
    change_column :route_pins, :lng, :decimal
  end
end
