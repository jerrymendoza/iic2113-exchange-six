class Coin < ApplicationRecord
    has_many :transactions
end

# == Schema Information
#
# Table name: coins
#
#  id         :bigint(8)        not null, primary key
#  tipo       :string
#  precio_clp :float
#  cantidad   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
