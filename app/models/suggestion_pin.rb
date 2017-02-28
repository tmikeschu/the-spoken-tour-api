class SuggestionPin < ApplicationRecord
  validates_presence_of :lat, :lng, :label, :description

  enum category: %w(
    stay
    checkout
    avoid
    bike_shop
    other
  )
end
