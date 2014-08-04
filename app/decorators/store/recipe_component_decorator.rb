class Store::RecipeComponentDecorator < ApplicationDecorator
  delegate_all

  def name
    object.constituent.name
  end
end
