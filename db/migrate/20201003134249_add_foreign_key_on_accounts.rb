class AddForeignKeyOnAccounts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :accounts, :users, validate: false
  end
end
