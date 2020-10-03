class AddPrecioCompraToCoins < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :precio_compra, :float
  end
end
