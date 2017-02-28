class CreateCurrentLocationPins < ActiveRecord::Migration[5.0]
  def change
    create_table :current_location_pins do |t|
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
