class AddBankTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bank_token, :string
  end
end
