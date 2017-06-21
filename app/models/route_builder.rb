class RouteBuilder
  def self.add_or_update_todays_location(location_data)
    new.add_or_update_todays_location(location_data)
  end

  def add_or_update_todays_location(location_data)
    lat_lng         = location_data[:location]
    bad_data        = lat_lng[:lat] == 0 && lat_lng[:lng] == 0
    todays_location = CurrentLocationPin.for_date(Time.now)

    check_data[bad_data].call(todays_location, lat_lng)
  end

  def create_or_update
    -> todays_location, lat_lng do
      (todays_location && todays_location.update(lat_lng)) ||
        CurrentLocationPin.create!(lat_lng)
    end
  end

  private

  def check_data
    {
      true  => no_change,
      false => create_or_update
    }
  end

  def no_change
    -> todays_location, _ { todays_location }
  end
end

