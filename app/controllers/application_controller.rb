class ApplicationController < ActionController::API
  include ActionController::Cookies
    before_action :authorize 
    
end
