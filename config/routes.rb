Rails.application.routes.draw do
  devise_for :users
  root to: "car_washes#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root  "posts#index"

  resources :car_washes do
    resources :appointments
  end
  resources :cars
  resources :appointments, only: :destroy

  resources :appointments do
    member do
      post :approve
      post :decline
    end
  end
end
