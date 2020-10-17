class Account < ApplicationRecord
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
#
