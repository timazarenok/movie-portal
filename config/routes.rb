Rails.application.routes.draw do
  devise_for :users
  {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)
  
  get 'users/profile', as: 'user_root'
  
  resources :movies do
    resources :likes
    resources :wishes
  end

  resources :directors, :actors
  get 'search', to: 'search#search'
    
  root 'index#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
