class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/{user id}
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.error, status: :unprocesable_entity
    end
  end

  # PUT /users/{user id}
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/{user id}
  def destroy
    @user.destroy
  end

  def get_transactions
    # change token to user.token
    token = "nnYawuaSY427Lucp1LjM"
    uri="https://bankeleven.herokuapp.com/api/v1/transactions/?api_token=#{token}"
    response = HTTParty.get(uri,
      {format: :json})
    render json: response
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :account_id, :bank_token)
  end
end