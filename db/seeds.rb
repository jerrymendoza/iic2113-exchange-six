# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# Write the code in a way that can be executed multiple times without duplicating the information.
#
# For example:
#
# Country.create(name: "Chile") # BAD
# Country.find_or_create_by(name: "Chile") # GOOD
#

# Coins
Coin.create({tipo: "BTF",
  cantidad: 1000,
  precio_venta: 5000, 
  precio_compra: 5000
})

Coin.create({tipo: "BTH",
  cantidad: 2000,
  precio_venta: 8000, 
  precio_compra: 8000
})
puts "Seed de coins finalizado"

# Accounts
Account.destroy_all
5.times do |number|
  puts number
  date = Faker::Date.between(from: 4.days.ago, to: Date.today)
  Account.create({id: number, saldo_clp: rand(1000), btfs: rand(100),
    bths: rand(100), is_partner: [true, false].sample, created_at: date,
    updated_at: date, user_id: rand(8)})
end
puts "Seed de cuentas finalizado"