Rails.application.routes.draw do
  namespace :vendor do
    get 'bookings/index'
    get 'bookings/show'
    get 'bookings/edit'
    get 'bookings/update'
  end
  devise_for :users
  root to: "vehicles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :vehicles
  resources :bookings, except: [ :destroy ]

  namespace :vendor do 
    resources :bookings, only: [ :index, :show, :edit, :update ]
  end
end
