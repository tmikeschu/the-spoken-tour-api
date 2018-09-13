# SuggestionPinsController handles requests for reading all suggestions and for
# creating one from the react client.

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
    params.require(:pin).permit(
      :label, :lat, :lng, :description, :message, :email, :name
    ).merge(category)
  end

  def category
    if params.key?(:category)
      { category: params.fetch(category).to_i }
    else
      {}
    end
  end
end
