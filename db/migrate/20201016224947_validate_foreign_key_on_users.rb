class ValidateForeignKeyOnUsers < ActiveRecord::Migration[6.0]
  def change
    validate_foreign_key :users, :accounts
  end
end
