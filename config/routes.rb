Rails.application.routes.draw do
  root :to => "venues#index"
  resources :very_bests
  devise_for :users
  resources :users
  resources :dishes
  resources :venues
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
