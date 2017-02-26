class Api::V1::InstagramPhotosController < ApplicationController
  def index
    render json: InstagramPhoto.all
  end
end
