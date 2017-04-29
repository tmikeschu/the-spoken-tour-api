Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :route_pins, only: [:index]
      get '/instagram_photos', to: "instagram_photos#index"

      resources :suggestion_pins, only: [:index, :create, :show]

      get '/current_location', to: "current_location_pin#show"
      post '/current_location', to: "current_location_pin#create"
      post '/contact', to: "contact#create"
    end
  end

  root to: "home#show"
end
