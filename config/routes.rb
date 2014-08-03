Rails.application.routes.draw do
  namespace :store do
    resources :categories
  end

  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'home#index'
end
