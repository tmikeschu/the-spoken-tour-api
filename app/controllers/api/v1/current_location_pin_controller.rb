class Api::V1::CurrentLocationPinController < ApplicationController
  def show
    pin_params = InreachService.latest_coordinates
    pin = CurrentLocationPin.new(pin_params)
    if pin.save!
      render json: pin, status: 201
    else
      render json: pin.errors.full_messages.join(", ")
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

