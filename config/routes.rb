Rails.application.routes.draw do
  root to: 'products#index'
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
end
