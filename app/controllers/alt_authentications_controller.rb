class AltAuthenticationsController < ApplicationController
  # GET /alt_authentications
  # GET /alt_authentications.json
  def index
    @alt_authentications =current_user.altAuthentication if current_user

#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @alt_authentications }
#    end
#  end

  def create
    auth = request.env["rack.auth"]
    current_user.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
    flash[:notice]= "Authentication Successful"
  end

  # PUT /alt_authentications/1
  # PUT /alt_authentications/1.json
 
  def destroy
    @alt_authentication =current_user.AltAuthentications.find(params[:id])
    @alt_authentication.destroy
    flash[:notice]="succesfully destroyed authentication."
    redirect_to alt_authentications_url

    respond_to do |format|
      format.html { redirect_to alt_authentications_url }
      format.json { head :no_content }
    end
  end
end
