Rails.application.routes.draw do
  devise_for :users
  # , controllers: {
  #   registrations: 'users/registrations',
  # }
  root to: "items#index"
  # root to: 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :new] do
    member do
      get 'buy'
    end
  end
end

