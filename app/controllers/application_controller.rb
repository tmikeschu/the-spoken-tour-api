class ApplicationController < ActionController::API
  before_action :authenticate_request

  private
    def authenticate_request
      render json: { error: 'Not Authorized' }, status: 401 unless authorized?
    end

    def authorized?
      params[:api_key] && params["api_key"] == ENV["api_key"]
    end
end
