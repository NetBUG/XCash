class CreateStoreMenus < ActiveRecord::Migration
  def change
    create_table :store_menus do |t|
      t.string :name

      t.timestamps
    end
  end
end
