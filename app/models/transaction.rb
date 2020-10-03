class Transaction < ApplicationRecord
  belongs_to :coin
  belongs_to :account
end

# == Schema Information
#
# Table name: transactions
#
#  id         :bigint(8)        not null, primary key
#  coin_id    :bigint(8)
#  account_id :bigint(8)
#  cantidad   :integer
#  valor_clp  :float
#  tipo       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_transactions_on_account_id  (account_id)
#  index_transactions_on_coin_id     (coin_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (coin_id => coins.id)
#
