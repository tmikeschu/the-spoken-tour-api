class CurrentLocationPin < ApplicationRecord
  validates_presence_of :lat, :lng

  default_scope   -> { where.not(lat: 0, lng: 0) }
  scope :by_date, -> { order(:created_at) }

  def self.for_date(date)
    find_by("DATE(created_at) = ?", date.utc.to_date)
  end

  def self.latest
    by_date.last
  end
end
