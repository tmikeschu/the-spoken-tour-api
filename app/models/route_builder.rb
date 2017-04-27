class RouteBuilder
  def self.add_or_update_todays_location(location_data)
    new.add_or_update_todays_location(location_data)
  end

  def add_or_update_todays_location(location_data)
    @lat_lng = location_data[:location]
    todays_location = CurrentLocationPin
      .find_by("DATE(created_at) = ?", Time.now.utc.to_date)

    if todays_location
      todays_location.update(@lat_lng)
    else
      CurrentLocationPin.create!(@lat_lng)
    end
  end
end

