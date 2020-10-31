class ValidateForeignKeyOnTransactions < ActiveRecord::Migration[6.0]
  def change
    validate_foreign_key :transactions, :coins
    validate_foreign_key :transactions, :accounts
  end
end
