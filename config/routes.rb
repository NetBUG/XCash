Rails.application.routes.draw do
  namespace :store do
    resources :orders do
      resources :order_items, path: 'items'
    end
    resources :menus do
      resources :menu_items, path: 'items'
    end
    resources :categories do
      resources :recipes, shallow: true do
        resources :recipe_components, path: 'components'
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
