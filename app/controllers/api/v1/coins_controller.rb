class Api::V1::CoinsController < Api::V1::BaseController
	before_action :set_coin, only: [:show, :update, :destroy]
  skip_before_action :doorkeeper_authorize!, only: [:index]
  # GET /coins
  def index
      @coins = Coin.all
      render json: @coins
  end

  # GET /coins/{coin id}
  def show
    render json: @coin
  end

  # POST /coins
  def create
    @coin = Coin.new(coin_params)

    if @coin.save
      render json: @coin, status: :created
    else
      render json: @coin.errors, status: :unprocessable_entity
    end
  end

  # PUT /coins/{coin id}
  def update
    if @coin.update(coin_params)
      render json: @coin
    else
      render json: @coin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /coins/{coin id}
  def destroy
    @coin.destroy
  end

  private

  def set_coin
    @coin = Coin.find(params[:id])
  end

  def coin_params
    params.require(:coin).permit(:tipo, :cantidad, :precio_venta, :precio_compra)
  end
end
