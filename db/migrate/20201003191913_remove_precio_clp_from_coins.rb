class RemovePrecioClpFromCoins < ActiveRecord::Migration[6.0]
  def change
    safety_assured { remove_column :coins, :precio_clp }
  end
end
