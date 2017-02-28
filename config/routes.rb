Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :route_pins do
        get '/denver_to_carlsbad', to: "denver_to_carlsbad#index"
        get '/carlsbad_to_costa_rica', to: "carlsbad_to_costa_rica#index"
        get '/costa_rica_to_darien_gap', to: "costa_rica_to_darien_gap#index"
        get '/darien_gap_to_cabo_froward', to: "darien_gap_to_cabo_froward#index"
      end
      get '/instagram_photos', to: "instagram_photos#index"

      resources :suggestion_pins, only: [:index, :create, :show]
    end
  end

  root to: "home#show"
end
