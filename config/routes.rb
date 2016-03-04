Rails.application.routes.draw do
  devise_for :users, path: '/users'  

  root to: "posts#index"

  resources :posts do 

    resources :likes, module: :posts

    resources :comments do 

      resources :likes, module: :comments

    end

  end

  resources :users, only: [:index, :show, :edit, :update]
  resources :friends, :controller => 'friendships', :except => [:show, :edit] do
    get "requests", :on => :collection
    get "invites", :on => :collection
  end
end
