class CurrentLocationPin < ApplicationRecord
  validates_presence_of :lat, :lng
end
