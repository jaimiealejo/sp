Sp::Application.routes.draw do

  resources :invoice_invoice_details


  resources :invoice_details


  resources :invoices


  resources :inventories


  resources :products


  resources :appointments


  resources :patients do
    resources :procedures
  end


  devise_for :users

  put '/appointments/:id/cancel', to: 'appointments#cancel', as: 'cancel_appointment'
  root :to => 'dashboard#index'
end
