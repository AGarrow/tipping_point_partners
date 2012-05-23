class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
     if user && user.authenticate(params[:session][:password])
       # Sign the user in and redirect to the user's show page.
     else
       flash[:error] = 'Invalid email/password combination' # Not quite right!
       render 'new'
     end
  end

  def destroy
  end
end
