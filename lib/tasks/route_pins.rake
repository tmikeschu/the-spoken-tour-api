require "CSV"

namespace :route_pins do
  desc "Load pins"
  task load: :environment do
    raw_points = CSV.readlines("./db/route_pins.csv", headers: true)
    raw_points.each do |row|
      lat, lng = row["Lat / Long"].split(", ").map(&:to_f)
      pin = RoutePin.new(lat: lat, lng: lng)

      if pin.save!
        puts "Pin #{pin.id} successfully created!"
      else
        "whoops!"
      end
    end
  end
end
