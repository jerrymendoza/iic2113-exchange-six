class ApplicationController < ActionController::Base
    # Devise code
  protect_from_forgery unless: -> { request.format.json? }
  #before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :doorkeeper_authorize!
  before_action :add_variation
  respond_to :json

  private 
  def add_variation
    yes ||= ExchangeVariationWorker.perform_async
  end

  protected

  # Devise methods
  # Authentication key(:email) and password field will be added automatically by devise.
  #def configure_permitted_parameters
  #  added_attrs = [:email]#[:email, :first_name, :last_name]
  #  devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  #  devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  #end

  # Doorkeeper methods
  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
