Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'index#index'

  # for ajax
  get 'movies/data/:page' => 'movies/main#data'
  resources :movies, :controller => 'movies/main' do
    resources :histories, :controller => 'movies/histories'
  end

  # The priority is based upon order of creation: first created -> highest priority.
end
