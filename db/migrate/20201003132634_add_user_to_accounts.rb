class AddUserToAccounts < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!
  def change
    add_reference :accounts, :user, index: {algorithm: :concurrently}
  end
end
