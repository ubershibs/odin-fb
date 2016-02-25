Rails.application.routes.draw do
  devise_for :users, path: '/users'  

  root to: "posts#index"

  resources :posts do 
    resources :comments
  end
end
