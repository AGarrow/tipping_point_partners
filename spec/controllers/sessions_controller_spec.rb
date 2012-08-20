require 'spec_helper'
include SessionsHelper
describe SessionsController do

@lonely = FactoryGirl.create(:company, :name => 'lonely')
let(:user) {FactoryGirl.create(:user, :email => 'fred_astaire@lonely.com')}


  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "sign in" do
    it "should accept valid passwords" do
      post :create, {:password => '1234567'}
      response.should redirect_to home_path
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

end
