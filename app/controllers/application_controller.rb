class ApplicationController < ActionController::Base
  protect_from_forgery
  def admin_access_required 
      access_denied unless admin?
  end
end