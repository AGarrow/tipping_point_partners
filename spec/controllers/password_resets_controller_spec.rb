require 'spec_helper'
include SessionsHelper

describe PasswordResetsController do
	before do 
		@vandelay = FactoryGirl.create(:company, :name => 'vandelay')
		@user = FactoryGirl.create(:user, :email => 'jerry_seinfeld@vandelay.com', :role => 'employee' )
	end
  describe "create new password reset" do
  	it "should assign the user a password_reset token" do
  		get :create, {:email => 'jerry_seinfeld@vandelay.com'}
  		@user.password_reset_token.should_not == nil 
  	end
  	
  end

  
	
end
