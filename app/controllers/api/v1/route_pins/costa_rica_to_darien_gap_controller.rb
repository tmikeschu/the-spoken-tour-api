class Api::V1::RoutePins::CostaRicaToDarienGapController < ApplicationController
  def index
    render json: RoutePin.where(route_leg: 2)
  end
end
