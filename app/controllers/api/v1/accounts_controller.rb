class Api::V1::AccountsController < Api::V1::BaseController
  before_action :set_account, only: [:show, :update, :destroy, :tokens, :generate_token]

  # GET /accounts
  def index
      @account = Account.where(user: current_resource_owner).first
      render json: @account
  end
  # GET 
  def tokens
    sql = """SELECT token, expires_in
            FROM oauth_access_tokens 
            WHERE resource_owner_id = #{@account.id}"""

    result = ActiveRecord::Base.connection.execute(sql)
    render json: result.to_json
  end
  # POST 
  def generate_token
    application = Doorkeeper::Application.all.first
    access_token = Doorkeeper::AccessToken.create!(
      :application_id => application.id, 
      :resource_owner_id => @account.id, :scopes => "")

    sql = """SELECT *
           FROM oauth_access_tokens 
           WHERE resource_owner_id = #{@account.id} 
           ORDER BY created_at DESC
           LIMIT 1"""
    result = ActiveRecord::Base.connection.execute(sql)
    render json: result[0].to_json

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
    params.require(:account).permit(:saldo_clp, :btfs, :bths, :is_partner)
  end
end
