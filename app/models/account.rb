class Account < ApplicationRecord
    belongs_to :user
    has_many :transactions
end

# == Schema Information
#
# Table name: accounts
#
#  id         :bigint(8)        not null, primary key
#  saldo_clp  :float
#  btfs       :integer
#  bths       :integer
#  is_partner :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#
# Indexes
#
#  index_accounts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
