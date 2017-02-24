class Api::V1::RoutePins::DenverToCarlsbadController < ApplicationController
  def index
    render json: RoutePin.where(route_leg: 0)
  end
end
