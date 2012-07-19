require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "should have the content 'Welcome'" do
      get 'home'
      page.should have_content ('Welcome')
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

  describe "GET 'workspace'" do
    it "returns http success" do
      get 'workspace'
      response.should be_success
    end
  end

  describe "GET 'faqs'" do
    it "returns http success" do
      get 'faqs'
      response.should be_success
    end
  end

end
