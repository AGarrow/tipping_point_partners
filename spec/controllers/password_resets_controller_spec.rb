require 'spec_helper'
include SessionsHelper

describe PasswordResetsController do

describe "basic authentication" do
  	it "should load forgot password page" do
  		get :new
  		response.should be_success
  	end
  	
  end

  
	
end
