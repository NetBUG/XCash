class CreateStoreRecipeComponents < ActiveRecord::Migration
  def change
    create_table :store_recipe_components do |t|
      t.belongs_to :recipe, index: true, foreign_key: {references: :store_recipes}
      t.decimal :amount, default: '0.0'
      t.string :measure
      t.belongs_to :constituent, index: true, foreign_key: {references: :stock_constituents}

      t.timestamps
    end
  end
end
