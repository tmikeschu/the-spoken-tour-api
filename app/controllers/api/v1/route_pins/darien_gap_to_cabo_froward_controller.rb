class Api::V1::RoutePins::DarienGapToCaboFrowardController < ApplicationController
  def index
    render json: RoutePin.where(route_leg: 3)
  end
end
