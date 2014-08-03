class CreateStoreCategories < ActiveRecord::Migration
  def change
    create_table :store_categories do |t|
      t.string :name
      t.string :color
      t.boolean :check_age, default: false
      t.boolean :show_recipe, default: false
      t.belongs_to :parent, index: true
      t.integer :lft, index: true
      t.integer :rgt, index: true
      t.integer :depth, index: true
      t.index [:name, :parent_id], unique: true

      t.timestamps
    end
  end
end
