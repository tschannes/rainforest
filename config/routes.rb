Rainforest::Application.routes.draw do

  root 'products#index'
  
  resources :products do
    resources :reviews, :except => [:index]
  end
  resources :users #, :only => [:new, :create, :update, :show, :update]
  resources :sessions, :only => [:new, :create, :destroy]

  
end
