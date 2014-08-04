class CreateStockConstituents < ActiveRecord::Migration
  def change
    create_table :stock_constituents do |t|
      t.string :name, index: {unique: true}
      t.decimal :amount, default: '0.0'
      t.string :measure

      t.timestamps
    end
  end
end
