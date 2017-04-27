class InreachService
  def self.latest_coordinates
    new.latest_coordinates
  end

  def latest_coordinates
    { 
      location: {
        lat: latitude, lng: longitude
      },
      date: date
    }  
  end

  private 
    def conn
      @conn ||= Faraday.new("https://inreach.garmin.com")
      @conn.basic_auth("tommycrosby26@gmail.com", "Socksthecat852!")
      @conn
    end

    def response
      conn.get("/feed/Share/TommyCrosby")
    end

    def response_data
      response.body
    end

    def latitude
      Nokogiri.XML(response_data).css("Data[name='Latitude'] value").text.to_d
    end

    def longitude
      Nokogiri.XML(response_data).css("Data[name='Longitude'] value").text.to_d
    end

    def date
      Nokogiri.XML(response_data).css("Data[name='Time'] value").text
    end
end

