class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  acts_as_token_authentication_handler_for User
end
