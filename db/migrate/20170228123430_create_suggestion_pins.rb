class CreateSuggestionPins < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestion_pins do |t|
      t.string :label
      t.string :description
      t.integer :category, default: 4
      t.decimal :lat
      t.decimal :lng
      t.string :message

      t.timestamps
    end
  end
end
