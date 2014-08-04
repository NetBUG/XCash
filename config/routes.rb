Rails.application.routes.draw do
  namespace :store do
    resources :menus
  end

  namespace :store do
    resources :categories do
      resources :recipes do
        resources :recipe_components
      end
    end
  end

  namespace :stock do
    resources :constituents
  end

  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'store/categories#index'
end
