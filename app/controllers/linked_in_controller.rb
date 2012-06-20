require 'linkedin'
class LinkedInController < ApplicationController
  def index 
    #retrieve api keys
    client = LinkedIn::Client.new("ppcjz72tyk7c","MnYxWzGIIRTI0tOw")
    request_token = client.request_token(:oauth_callback => "http://#{request.host_with_port}/linked_in/callback")
    
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret
    
    redirect_to client.request_token.authorize_url
  end
  
  def callback
    client = LinkedIn::Client.new("ppcjz72tyk7c","MnYxWzGIIRTI0tOw")
    if current_user.nil?
    if current_user.atoken.nil?
      pin = params[:oauth_verifier]
      atoken, asecret = client.authorize_from_request(session[:rtoken],session[:rsecret],pin)
      current_user.atoken = atoken
      current_user.asecret = asecret
    else
      client.authorize_from_access(current_user.atoken, current_user.asecret)
    end
    @profile = client.profile
    @connections = client.connections
  end
  
  def show

#    client.authorize_from_access(session[:atoken], session[:asecret])

     respond_to do |format|
       format.html # show.html.erb
       format.json { render json: @user }
     end
      
  end
  

end
