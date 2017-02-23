class CreateRoutePins < ActiveRecord::Migration[5.0]
  def change
    create_table :route_pins do |t|
      t.integer :lat
      t.integer :lng

      t.timestamps
    end
  end
end
