Rails.application.routes.draw do
  resources :orders
  resources :products, :charges
  devise_for :users
  get 'home/index'
  # route for user products
  get 'products/userproducts/:user_id/' => 'products#userproducts', :as => :userproducts
  get 'products/admin_index/admin' => 'products#admin_index', :as => :admin_index
  get 'orders/myorders/:buyer_id' => 'orders#myorders', :as => :myorders
  get 'orders/mysales/:seller_id' => 'orders#mysales', :as => :mysales
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
end
