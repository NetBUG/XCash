Rails.application.routes.draw do
  namespace :stock do
    resources :constituents
  end

  namespace :store do
    resources :recipes
  end

  namespace :store do
    resources :categories
  end

  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'home#index'
end
