class InreachService
  def self.latest_coordinates
    new.latest_coordinates
  end

  def latest_coordinates
    {
      location: {
        lat: latitude(response_data), lng: longitude(response_data)
      },
      date: date(response_data)
    }
  end

  def latitude(response_data)
    Nokogiri.XML(response_data).css("Data[name='Latitude'] value").text.to_d rescue 0
  end

  def longitude(response_data)
    Nokogiri.XML(response_data).css("Data[name='Longitude'] value").text.to_d rescue 0
  end

  def date(response_data)
    Nokogiri.XML(response_data).css("Data[name='Time'] value").text
  end

  private

  def conn
    @conn ||= Faraday.new("https://inreach.garmin.com") do |conn|
      conn.request(:basic_auth, ENV["inreach_user"], ENV["inreach_pw"])
    end
    @conn
  end

  def response
    conn.get("/feed/Share/TommyCrosby")
  end

  def response_data
    response.body
  end
end

