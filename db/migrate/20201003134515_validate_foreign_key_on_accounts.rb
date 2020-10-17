class ValidateForeignKeyOnAccounts < ActiveRecord::Migration[6.0]
  def change
    validate_foreign_key :accounts, :users
  end
end