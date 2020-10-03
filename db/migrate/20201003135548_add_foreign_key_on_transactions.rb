class AddForeignKeyOnTransactions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :transactions, :coins, validate: false
    add_foreign_key :transactions, :accounts, validate: false
  end
end
