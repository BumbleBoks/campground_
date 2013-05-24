class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
#  force_ssl
  
  include ApplicationHelper
  include SessionsHelper
  include Corner::LogsHelper
end
