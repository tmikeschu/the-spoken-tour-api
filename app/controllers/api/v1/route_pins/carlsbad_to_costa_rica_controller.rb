class Api::V1::RoutePins::CarlsbadToCostaRicaController < ApplicationController
  def index
    render json: RoutePin.where(route_leg: 1)
  end
end
