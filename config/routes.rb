Rails.application.routes.draw do
  get 'email_change_requests/new'
  get 'email_change_requests/create'
  get 'mypage/show'
  namespace :admin do
    root 'dashboard#index'
    resources :users, only: [:index, :edit, :create, :update, :destroy]
    resources :products, except: [:show]
    resources :stocks, only: [:index] do
      patch :replenish, on: :member
    end
    resources :replenishments, only: [:index, :update]
  end
  root "posts#index"
  resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
end
