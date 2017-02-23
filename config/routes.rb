Rails.application.routes.draw do
  devise_for :users


  root :to => "home#index"

  resources :contact
  resources :orders
  resources :items
  resources :users
  resources :addresses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
