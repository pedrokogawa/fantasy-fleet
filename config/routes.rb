Rails.application.routes.draw do
  devise_for :users
  root to: "vehicles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :vehicles do
    resources :reviews, only: [:new, :create, :destroy]
  end
  resources :bookings, except: [ :destroy ] do
    member do
      patch :cancel
    end
  end

  namespace :vendor do 
    resources :bookings, only: [ :index, :show ] do
      member do
        patch :accept
        patch :refuse
        patch :ongoing
        patch :completed
      end
    end
  end
end
