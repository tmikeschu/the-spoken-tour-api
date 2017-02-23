require 'rails/application_controller'

class HomeController < Rails::ApplicationController
  def show
    render file: Rails.root.join('app', 'views', 'home', 'show.html.erb')
  end
end
