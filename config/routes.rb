Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  # root to: 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :show] do
    collection do
      get 'credit'
      get 'logout'
    end
  end
  resources :items, only: [:index, :new, :show, :create, :destroy, :edit, :update] do
    member do
      get 'buy'
      get 'sold'
    end
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end
end

