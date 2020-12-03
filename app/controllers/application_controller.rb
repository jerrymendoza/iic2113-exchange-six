class ApplicationController < ActionController::Base
  before_action :doorkeeper_authorize!
  before_action :add_variation
  respond_to :json

  private 
  def add_variation
    yes ||= ExchangeVariationWorker.perform_async
  end

  protected¢
  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
