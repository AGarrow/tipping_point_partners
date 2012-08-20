require 'spec_helper'
include SessionsHelper

describe PagesController do
  @bluthCO = FactoryGirl.create(:company, :name => 'bluth')
  let(:user) {FactoryGirl.create(:user, :email => 'george_michael@bluth.com', :role => 'employee')}


  describe "access control" do
    it "should redirect to signin page" do
      get 'home'
      response.should redirect_to signin_path
    end
  end


  describe "basic functions" do
    before do
      sign_in user
    end
    describe "GET 'home'" do
      it "should have the content 'Welcome'" do
        get 'home'
        response.should be_success
      end
    end

    describe "GET 'me'" do
      it "returns http success" do
        get 'me'
        response.should be_success
      end
    end

    describe "GET 'my_company'" do
      it "returns http success" do
        get 'my_company'
        response.should be_success
      end
    end

    describe "GET 'faqs'" do
      it "returns http success" do
        get 'faqs'
        response.should be_success
      end
    end

    describe "GET kyocera_mac" do
      it "returns http success" do
        get 'kyocera_mac'
        response.should be_success
      end
    end

    describe "GET kyocera_windows" do
      it 'returns http success' do
        get 'kyocera_windows' 
        response.should be_success
      end
    end
  end
end
