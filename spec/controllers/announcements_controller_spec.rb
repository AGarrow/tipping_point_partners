require 'spec_helper'
include UsersHelper

describe AnnouncementsController do
  render_views

  describe "access control" do
    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(home_path)
    end

    it "should deny access to 'delete'" do
      delete :destroy, :id => 1
      response.should redirect_to(home_path)
    end
  end

  describe "POST 'create'" do
    before do
      @teslaCO = FactoryGirl.create(:company, :name => 'teslar motors')
      @user = FactoryGirl.create(:user, :email => 'announcement_creator@teslarmotors.com', :role => 'admin')
      sign_in(@user)
    end

    describe "failure" do
      before do
        @attr = {:title => "hello world", :content => ""}
      end

      it "should not create a micropost" do
        lambda do
          post :create, :announcement => @attr
        end.should_not change(Announcement, :count)
      end
    end

    describe "success" do 
      before do
        sign_in(@user) 
      end

      it "should create an announcement" do
        lambda do
          post :create, @teslaCO.announcements.new(@attr)
        end.should change(Announcement, :count).by(1)
      end
    end
  end











  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

end
