class CreateStoreMenuItems < ActiveRecord::Migration
  def change
    create_table :store_menu_items do |t|
      t.belongs_to :menu, index: true, foreign_key: {references: :store_menus}
      t.belongs_to :recipe, index: true, foreign_key: {references: :store_recipes}

      t.timestamps
    end
  end
end
