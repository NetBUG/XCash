class CreateStoreRecipes < ActiveRecord::Migration
  def change
    create_table :store_recipes do |t|
      t.string :name
      t.belongs_to :category, index: true, foreign_key: {references: :store_categories}
      t.decimal :price
      t.string :color
      t.boolean :check_age, default: false
      t.boolean :show_recipe, default: false

      t.index [:name, :category_id], unique: true

      t.timestamps
    end
  end
end
