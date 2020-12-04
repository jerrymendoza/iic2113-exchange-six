# frozen_string_literal: true

class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :doorkeeper_authorize!
  skip_before_action :verify_authenticity_token
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    build_resource(sign_up_params)
    if (validate_token)
      save_resource(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      self.response.status = :unprocessable_entity
      render json: {"errors": {"bank_token":["No es valido"]}}
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private

  def sign_up_params
      params.require(:user).permit(:email, :password, :bank_token)
  end

  def validate_token
    token = sign_up_params["bank_token"]
    puts 'bank token is:'+ token + "------------"
    uri = "https://bankeleven.herokuapp.com/api/v1/transactions/?api_token=#{token}"
    query = HTTParty.get(uri, {format: :json})
    puts "code is: #{query.code}------------"
    if query.code == 200
      return true
    end
    false
  end

  def save_resource(resource)
    resource.save
    if resource.persisted?;
      if resource.active_for_authentication?
        render json: resource # , location: after_sign_up_path_for(resource)
      else
        expire_data_after_sign_in!
        render json: resource # , location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
end
