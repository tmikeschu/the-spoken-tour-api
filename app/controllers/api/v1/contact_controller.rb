class Api::V1::ContactController < ApplicationController
  def create
    data = contact_params.to_h
    if data && data.keys.length == 3
      ContactJob.set(wait: 20.seconds).perform_later(data) 
      render json: { message: "Message Sent!" }, status: 201
    else
      render json: { message: "Missing data" }, status: 400
    end
  end

  private 
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
