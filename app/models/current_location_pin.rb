class CurrentLocationPin < ApplicationRecord
  validates_presence_of :lat, :lng

  scope :by_date, -> { order(:created_at) }
end
