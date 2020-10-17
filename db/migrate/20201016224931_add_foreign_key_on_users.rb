class AddForeignKeyOnUsers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users, :accounts, validate: false
  end
end
