class ApplicationController < ActionController::Base
  
  protect_from_forgery
  include SessionsHelper
  include UsersHelper
  def admin_access_required 
      access_denied unless admin?
  end
  
rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied."
  redirect_to root_url
end
end