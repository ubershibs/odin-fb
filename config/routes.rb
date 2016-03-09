Rails.application.routes.draw do
  devise_for :users, path: '/users'

  root to: "posts#index"

  resources :posts do
    resources :likes, module: "posts", only: [:create, :destroy]

    resources :comments do

      resources :likes, module: "comments", only: [:create, :destroy]

    end
  end
  resources :users, only: [:index, :show, :edit, :update]
  resources :friends, :controller => 'friendships', :except => [:show, :edit] do
    get "requests", :on => :collection
    get "invites", :on => :collection
  end
  resources :likes, only: [:destroy]
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end
end
