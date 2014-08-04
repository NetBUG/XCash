class AddMenuToRecipeComponents < ActiveRecord::Migration
  def change
    add_column :store_recipe_components, :show_in_menu, :boolean, default: false
  end
end
