Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'index#index'
  get 'index/users_show'
  resources :reviews
  get 'contents/search', to: 'contents#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
