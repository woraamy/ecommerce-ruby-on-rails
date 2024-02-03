class AddPriceAddStockToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :price, :integer, default: 0
    add_column :products, :stock, :integer, default: 0
  end
end
