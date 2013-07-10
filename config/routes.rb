Rainforest::Application.routes.draw do

  # get "cat/new"
  # get "cat/edit"
  # get "cat/show"
  
  
  resources :products do
    resources :reviews, :except => [:index]
  end
  resources :users #, :only => [:new, :create, :update, :show, :update]
  resources :sessions, :only => [:new, :create, :destroy]
  resources :categories, :except => :show

  root 'products#index'

end