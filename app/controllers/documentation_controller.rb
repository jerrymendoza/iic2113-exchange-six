class DocumentationController < ApplicationController
    skip_before_action :doorkeeper_authorize!
  
    # GET /
    def index

    end
    
end