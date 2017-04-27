class RemoveRouteLegFromRoutePins < ActiveRecord::Migration[5.0]
  def change
    remove_column :route_pins, :route_leg, :string
  end
end
