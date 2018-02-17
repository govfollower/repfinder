module Api::V1
  class ApiController < ApplicationController
    # Generic API stuff here
    # Figure out how to handle CSRF on mobile devices
    skip_before_action :verify_authenticity_token
    
  end
end
