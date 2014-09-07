ActiveAdmin.register Store::Category do
  menu parent: :store

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  permit_params do
    permitted = [:parent_id, :name, :color, :check_age, :show_recipe, :lft, :rgt, :depth]
    #permitted << :other if resource.something?
    #permitted
  end


end
