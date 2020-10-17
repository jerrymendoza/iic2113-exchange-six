class AddAccountToUsers < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!
  def change
    add_reference :users, :account, index: {algorithm: :concurrently}
  end
end
