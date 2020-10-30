class Api::V1::AccountsController < Api::V1::BaseController
  before_action :set_account, only: [:show, :update, :destroy]

  # GET /accounts
  def index
      @account = Account.where(user: current_resource_owner).first
      render json: @account
  end

  # GET /accounts/{account id}
  def show
    render json: @account
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)

    if @account.save
      render json: @account, status: :created
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # PUT /accounts/{account id}
  def update
    if @account.update(account_params)
      render json: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accounts/{account id}
  def destroy
    @account.destroy
  end

  private

  def set_account
    @account = Account.where(user: current_resource_owner).first
  end

  def account_params
    params.require(:account).permit(:saldo_clp, :btfs, :bths, :is_partner).merge(:account_id => @account.id)
  end
end
