Sp::Application.routes.draw do
  
  resources :appointments


  resources :patients do
    resources :procedures
  end


  devise_for :users

 root :to => 'dashboard#index'
end
