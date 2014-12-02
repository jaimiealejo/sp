Sp::Application.routes.draw do
  
  resources :invoice_details


  resources :invoices


  resources :inventories


  resources :products


  resources :appointments


  resources :patients do
    resources :procedures
  end


  devise_for :users

 root :to => 'dashboard#index'
end
