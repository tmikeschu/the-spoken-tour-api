class Api::V1::SuggestionPinsController < ApplicationController
  def index
    render json: SuggestionPin.all
  end

  def create
    pin = SuggestionPin.new(pin_params)
    if pin.save!
			SendEmailJob.set(wait: 20.seconds).perform_later(pin)
      render json: pin, status: 201
    else
      render json: pin.errors.full_messages.join(", ")
    end
  end

  def show
    pin = SuggestionPin.find(params[:id])
    render json: pin
  end

  private

  def pin_params
    strong = params.require(:pin).permit(
      :label, :lat, :lng, :description, :message, :category, :email, :name
    ).to_h
    strong["category"] = strong["category"].to_i if strong["category"]
    strong
  end
end
