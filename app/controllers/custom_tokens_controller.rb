class CustomTokensController < Doorkeeper::TokensController

  include AbstractController::Callbacks
  before_action :set_headers

  def set_headers
    puts 'headers set'
    headers['Access-Control-Allow-Origin'] = 'http://localhost:3001'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = '*,X-Requested-With,Content-Type,If-Modified-Since,If-None-Match'
    headers['Access-Control-Max-Age'] = '86400'
  end
end
