class ApplicationController < ActionController::Base
  @title="LLC"
  protect_from_forgery
  include SessionsHelper
  include UsersHelper
  include CompaniesHelper
  include LinkedInHelper
 
  def admin_access_required 
      access_denied unless admin?
  end
  
  enable_authorization
  
  rescue_from CanCan::Unauthorized do |exception|
   flash[:error] = "Access denied."
   redirect_to home_path
  end
end