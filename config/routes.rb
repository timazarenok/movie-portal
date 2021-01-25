Rails.application.routes.draw do
  root 'index#index'

  devise_for :users
  { class_name: 'User' }.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)

  get 'users/profile', as: 'user_root'

  resources :movies do
    resources :likes
    resources :wishes
    resources :comments
  end

  resources :directors, :actors
  get 'search', to: 'search#search'
  get '/auth/:provider/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
