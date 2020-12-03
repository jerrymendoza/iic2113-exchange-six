class ExchangeVariationWorker
  include Sidekiq::Worker
  
  def perform
    loop do
      sleep 20
      random_value = rand(-0.2..0.2)
      Coin.all.each do |coin|
        puts coin.precio_venta
        coin.precio_venta = coin.precio_venta + coin.precio_venta * random_value
        puts coin.precio_venta
        puts "------"
        puts coin.precio_compra
        coin.precio_compra = coin.precio_compra + coin.precio_compra * random_value
        puts coin.precio_compra
        coin.save
      end
    end
  end
end