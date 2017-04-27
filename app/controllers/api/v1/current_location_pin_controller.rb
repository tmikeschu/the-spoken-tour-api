class Api::V1::CurrentLocationPinController < ApplicationController
  def show
    latest_location = InreachService.latest_coordinates
    if latest_location
      RouteBuilder.add_or_update_todays_location(latest_location)
      render json: latest_location, status: 201
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

  private
    def pin_params
      params.require(:pin).permit(:lat, :lng)
    end
end

