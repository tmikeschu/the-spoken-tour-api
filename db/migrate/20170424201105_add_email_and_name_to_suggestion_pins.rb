class AddEmailAndNameToSuggestionPins < ActiveRecord::Migration[5.0]
  def change
    add_column :suggestion_pins, :email, :string
    add_column :suggestion_pins, :name, :string
  end
end
