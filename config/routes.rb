Rails.application.routes.draw do
  root to: 'users#index'
  resources :items, only: :show
end
