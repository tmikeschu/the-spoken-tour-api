class RoutePin < ApplicationRecord
  validates_presence_of :lat, :lng
end
