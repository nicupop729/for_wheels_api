Rails.application.routes.draw do
  resources :users, only: [:index, :create]

  post 'users/log_in', to: 'users#log_in'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/cars', to: 'cars#index'
end
