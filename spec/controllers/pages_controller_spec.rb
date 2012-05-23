require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "returns http success" do
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
