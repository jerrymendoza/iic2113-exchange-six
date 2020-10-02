class CreateCoins < ActiveRecord::Migration[6.0]
  def change
    create_table :coins do |t|
      t.string :tipo
      t.float :precio_clp
      t.integer :cantidad

      t.timestamps
    end
  end
end
