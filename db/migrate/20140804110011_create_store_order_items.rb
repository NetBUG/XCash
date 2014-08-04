class CreateStoreOrderItems < ActiveRecord::Migration
  def change
    create_table :store_order_items do |t|
      t.belongs_to :order, index: true, foreign_key: {references: :store_orders}
      t.belongs_to :recipe, index: true, foreign_key: {references: :store_recipes}
      t.integer :amount, default: 1
      t.decimal :cost, default: '0.0'

      t.timestamps
    end
  end
end
