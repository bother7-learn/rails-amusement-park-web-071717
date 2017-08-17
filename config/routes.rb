Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show]

  root "static#index"

  get "/signin", to: "sessions#new", as: 'login'
  post "/signin", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  post "/attractions/:id/ride", to: "attractions#ride", as: :attraction_ride

end
