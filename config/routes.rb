Rails.application.routes.draw do
  resources :products, :charges
  devise_for :users
  get 'home/index'
  # route for user products
  get 'products/userproducts/:user_id/' => 'products#userproducts', :as => :userproducts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
end
