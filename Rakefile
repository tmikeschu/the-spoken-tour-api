require_relative 'config/application'

Rails.application.load_tasks

namespace :create_polyline_coordinates_for do
  desc "Convert KML coordinates to RoutePin objects"

  task :all => [
    :denver_to_carlsbad,
    :carlsbad_to_costa_rica,
    :costa_rica_to_darien_gap,
    :darien_gap_to_cabo_froward
  ]

  task :denver_to_carlsbad => :environment do
    import_coordinates("denver_to_carlsbad", 0)
  end

  task :carlsbad_to_costa_rica => :environment do
    import_coordinates("carlsbad_to_costa_rica", 1)
  end

  task :costa_rica_to_darien_gap => :environment do
    import_coordinates("costa_rica_to_darien_gap", 2)
  end

  task :darien_gap_to_cabo_froward => :environment do
    import_coordinates("darien_gap_to_cabo_froward", 3)
  end

  def import_coordinates(route_name, route_enum)
    raw_kml          = File.read("./db/#{route_name}.kml")
    parsed_kml       = Nokogiri::XML(raw_kml)
    raw_route_points = parsed_kml.search("coordinates").text.gsub(" ", "").split("\n").reject(&:empty?).uniq

    raw_route_points.each do |point|
      lng, lat = point.split(",")[0..1]
      RoutePin.create!(lat: lat, lng: lng, route_leg: route_enum)
      puts "Pin ##{RoutePin.last.id} for #{lat}, #{lng} of the #{RoutePin.last.route_leg} leg created!"
    end
  end
end
