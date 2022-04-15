Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create] do
    resources :rentals, except: [:new, :edit]
  end

  post 'users/log_in', to: 'users#log_in'

  get '/cars', to: 'cars#index'
end
