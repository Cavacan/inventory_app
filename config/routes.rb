Rails.application.routes.draw do
  get 'email_change_requests/new'
  get 'email_change_requests/create'
  get 'mypage/show'
  namespace :admin do
    get 'replenishments/index'
    get 'replenishments/update'
    get 'stocks/index'
    get 'stocks/update'
    get 'products/index'
    get 'products/new'
    get 'products/create'
    get 'products/edit'
    get 'products/update'
    get 'products/destroy'
    get 'users/index'
    get 'users/create'
    get 'users/update'
    get 'users/destroy'
    get 'dashboard/index'
  end
  root "posts#index"
  resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
end
