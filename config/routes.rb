Rails.application.routes.draw do
  devise_for :users

  resources :movies do
    resources :likes
  end

  resources :directors, :actors
  
  get 'users/profile', as: 'user_root'
  
  root 'index#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
