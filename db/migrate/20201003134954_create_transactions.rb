class CreateTransactions < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!
  def change
    create_table :transactions do |t|
      t.references :coin, index: {algorithm: :concurrently}
      t.references :account, index: {algorithm: :concurrently}
      t.integer :cantidad
      t.float :valor_clp
      t.string :tipo

      t.timestamps
    end
  end
end
