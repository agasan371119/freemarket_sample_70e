Rails.application.routes.draw do
  devise_for :users
  # , controllers: {
  #   registrations: 'users/registrations',
  # }
  root to: "home#index"
  # root to: 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
end
