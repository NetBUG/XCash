Rails.application.routes.draw do
  namespace :store do
    resources :menus do
      resources :menu_items
    end
    resources :categories do
      resources :recipes, shallow: true do
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
