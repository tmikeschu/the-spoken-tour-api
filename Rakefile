# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :route_pins do
  desc "Convert KML coordinates to RoutePin objects"
  task :create_db_objects => :environment do
=begin
doc = Nokogiri::XML(file)
points = doc.search("coordinates").text.gsub(" ", "").split("\n").reject(&:empty?)
points.each do |point|
lat, lng = point.split(",")[0,1]
RoutePin.create!(lat: lat, lng: lng)
puts "Pin created at #{lat}, #{long}"
=end
  end
end
