class Api::V1::CurrentLocationPinController < ApplicationController
  def show
    latest_coordinates = InreachService.latest_coordinates
    if latest_coordinates
      RouteBuilder.add_or_update_todays_location(latest_coordinates)
      render json: CurrentLocationPin.latest, status: 201
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
    render json: CurrentLocationPin.by_date
  end

  private

  def pin_params
    params.require(:pin).permit(:lat, :lng)
  end
end

