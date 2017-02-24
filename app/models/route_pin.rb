class RoutePin < ApplicationRecord
  validates_presence_of :lat, :lng

  enum route_leg: %w(
    denver_to_carlsbad
    carlsbad_to_costa_rica
    costa_rica_to_darien_gap
    darien_gap_to_cabo_froward
  )
end
