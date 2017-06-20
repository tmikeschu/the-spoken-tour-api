class Api::V1::CurrentLocationPinController < ApplicationController
  def show
    latest_location = InreachService.latest_coordinates
    if latest_location
      RouteBuilder.add_or_update_todays_location(latest_location)
      current = CurrentLocationPin.where.not(lng: 0, lat: 0).by_date.last
      render json: current, status: 201
    else
      render json: "Error retrieving data"
    end
  end

  def create
    pin = CurrentLocationPin.new(pin_params)
    if pin.save!
      render json: pin, status: 201
    else
      render json: pin.errors.full_messages.join(", ")
    end
  end

  def index
    @points = CurrentLocationPin.where.not(lat: 0, lng: 0).by_date
    render json: @points
  end

  private
    def pin_params
      params.require(:pin).permit(:lat, :lng)
    end
end

