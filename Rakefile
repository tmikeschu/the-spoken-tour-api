# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :route_pins do
  desc "Convert KML coordinates to RoutePin objects"
  task :create_db_objects => :environment do
    raw_kml          = File.read("./db/route-pins.kml")
    parsed_kml       = Nokogiri::XML(raw_kml)
    raw_route_points = parsed_kml.search("coordinates").text.gsub(" ", "").split("\n").reject(&:empty?).uniq

    raw_route_points.each do |point|
      lng, lat = point.split(",")[0..1]
      RoutePin.create!(lat: lat, lng: lng)
      puts "Pin ##{RoutePin.last.id} created at #{lat}, #{lng}"
    end
  end
end
