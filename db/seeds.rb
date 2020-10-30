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
require 'json'
# Coins
btf = Coin.create({tipo: "BTF",
  cantidad: 1000,
  precio_venta: 5000, 
  precio_compra: 5000
})
puts "Created #{btf.tipo}"
bth = Coin.create({tipo: "BTH",
  cantidad: 2000,
  precio_venta: 8000, 
  precio_compra: 8000
})
puts "Created #{bth.tipo}"

# Accounts
Account.destroy_all
5.times do |number|
  user = User.create({
    email: Faker::Internet.email(domain: 'uc.cl'),
    password: "password",
    password_confirmation: "password",
  })
  puts "Created #{user.email}"
  rand(7).times do |t|
    transaction = Transaction.create({
      coin: bth, 
      account: user.account, 
      cantidad: rand(3..15),
      valor_clp: rand(3000..3100),
      tipo:  ["COMPRA", "VENTA"].sample
    })
  end

end
application = Doorkeeper::Application.create(
  name: "Frontend",
  scopes: "read write",
  confidential: false,
  redirect_uri: "urn:ietf:wg:oauth:2.0:oob"
  ) 
  
  puts JSON.pretty_generate(application.attributes.as_json)
