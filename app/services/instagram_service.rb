class InstagramService
  def photos
    json[:items].map do |item|
      {
        caption: item[:caption][:text],
        image:   item[:images][:standard_resolution][:url],
        link:    item[:link]
      }
    end
  end

  def self.get_photos
    new.photos
  end

  private
    def conn
      @conn ||= Faraday.new("https://www.instagram.com")
    end

    def default_path
      "/thespokentour/media/"
    end

    def response
      conn.get(default_path)
    end

    def json
      JSON.parse(response.body, symbolize_names: true)
    end
end
