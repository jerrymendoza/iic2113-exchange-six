class AddPrecioVentaToCoins < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :precio_venta, :float
  end
end
