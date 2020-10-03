class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.float :saldo_clp
      t.integer :btfs
      t.integer :bths
      t.boolean :is_partner

      t.timestamps
    end
  end
end
