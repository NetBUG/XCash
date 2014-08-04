class CreateStoreOrders < ActiveRecord::Migration
  def change
    create_table :store_orders do |t|
      t.decimal :cost, default: '0.0'
      t.string :state, initial: 'waiting_for'

      t.timestamps
    end
  end
end
