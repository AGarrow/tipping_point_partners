require 'spec_helper'

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
      @user = User.create(:first_name => 'alexi', 
        :last_name => 'garrow', 
        :email => 'alexioaaaa@teslarmotors.com', 
        :password => '1234567', 
        :password_confirmation => '1234567',
        :role => 'admin')
      
    end

    describe "failure" do
      before do
        @attr = {:title => "hello world", :content => ""}
      end

      it "should not create an announcement" do
        lambda do
          post :create, :announcement => @attr
        end.should_not change(Announcement, :count)
      end
    end

    describe "success" do 
      before do
        @attr = {:title => "hello world", :content => "can you see me?"}
        test_sign_in @user 
      end
      it "should be an admin" do 
        @user.is?('admin').should == true
      end
      it "should belong to a company" do 
        @user.company.should_not == nil
      end
      it "should create an announcement" do
        lambda do
          post :create, :announcement => @attr
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
