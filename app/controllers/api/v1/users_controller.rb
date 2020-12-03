class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :update_current_balance, only: [:show, :update, :index]

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

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :account_id, :bank_token, :last_review, :saldo_clp)
  end

  def update_current_balance
    @user.update_balance
  end
end