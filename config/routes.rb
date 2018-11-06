Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, :charges

  # Resource routes for the messaging feature using mailboxer
  resources :conversations do
    resources :messages
  end

  devise_for :users

  # route for user products
  get 'products/userproducts/:user_id/' => 'products#userproducts', :as => :userproducts
  # route for delete conversation
  delete 'conversations/:id/' => 'conversations#destroy', :as => :conversation_destroy
  # Root path = products index
  root 'products#index'
end
