Rainforest::Application.routes.draw do
  
  resources :products do
    resources :reviews, :except => [:index]
  end
  resources :users #, :only => [:new, :create, :update, :show, :update]
  resources :sessions, :only => [:new, :create, :destroy]
  resources :categories, :except => :show

  root 'products#index'

end