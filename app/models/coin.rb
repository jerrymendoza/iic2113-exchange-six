class Coin < ApplicationRecord
    has_many :transactions
    self.ignored_columns = ["some_column"]
end

# == Schema Information
#
# Table name: coins
#
#  id            :bigint(8)        not null, primary key
#  tipo          :string
#  cantidad      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  precio_venta  :float
#  precio_compra :float
#
