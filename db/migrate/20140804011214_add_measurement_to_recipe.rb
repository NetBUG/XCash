class AddMeasurementToRecipe < ActiveRecord::Migration
  def change
    add_column :store_recipes, :amount, :decimal, default: '0.0'
    add_column :store_recipes, :measure, :string
  end
end
