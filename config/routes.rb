Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders
  resources :products, :charges

  # Resource routes for the messaging feature using mailboxer
  resources :conversations do
    resources :messages
  end

  devise_for :users

  # route for user products
  get 'products/userproducts/:user_id/' => 'products#userproducts', :as => :userproducts
  get 'products/admin_index/admin' => 'products#admin_index', :as => :admin_index
  get 'orders/myorders/:buyer_id' => 'orders#myorders', :as => :myorders
  get 'orders/mysales/:seller_id' => 'orders#mysales', :as => :mysales
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # route for delete conversation
  delete 'conversations/:id/' => 'conversations#destroy', :as => :conversation_destroy

  # Root path = products index
  root 'products#index'
end
