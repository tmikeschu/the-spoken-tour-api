class Api::V1::RoutePinsController < ApplicationController
  def index
    render json: RoutePin.all
  end
end
