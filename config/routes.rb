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
  get '/invoice/:id/generate', to: 'invoices#generate', as: 'generate_invoice'
  get '/invoice/:id/generate_partial', to: 'invoices#generate_partial', as: 'generate_partial_invoice'
  root :to => 'dashboard#index'
end
