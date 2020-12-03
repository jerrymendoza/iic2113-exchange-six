class ExchangeVariationWorker
  include Sidekiq::Worker
  
  def perform
    loop do
      sleep 10800
      random_value = rand(-0.2..0.2)
      Coin.all.each do |coin|
        coin.precio_venta = coin.precio_venta + coin.precio_venta * random_value
        coin.precio_compra = coin.precio_compra + coin.precio_compra * random_value
        coin.save
      end
    end
  end
end