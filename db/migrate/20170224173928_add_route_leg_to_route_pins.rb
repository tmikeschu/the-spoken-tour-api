class AddRouteLegToRoutePins < ActiveRecord::Migration[5.0]
  def change
    add_column :route_pins, :route_leg, :integer
  end
end
