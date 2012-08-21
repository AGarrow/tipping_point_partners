require 'spec_helper'
include SessionsHelper
describe AnnouncementsController do
  render_views


  describe "access control" do
    it "should deny access to 'create'" do
      lambda do
        post :create
      end.should_not change(Announcement, :count)
    end

    it "should deny access to 'delete'" do
      lambda do
        delete :destroy, :id => 1
      end.should_not change(Announcement, :count)
    end
  end


  describe "POST 'create'" do
    @teslaCO = FactoryGirl.create(:company, :name => 'tesla motors')
    let(:user) {FactoryGirl.create(:user, :email => 'alexi_garrow@teslamotors.com', :role => 'admin')}


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
        sign_in user 
        post :create, :announcement => @attr
      end

      it "should create an announcement" do
        lambda do
          post :create, :announcement => @attr
        end.should change(Announcement, :count).by(1)
      end
      
      it "should delete an announcement" do
        post :create, :announcement => @attr
        lambda do 
          delete :destroy, :id => 1
        end.should change(Announcement, :count).by(-1)
      end
      describe "properties" do
        let(:announcement) {Announcement.first}

        it "should belong to the right company" do
          announcement.company.name.should == 'tesla motors'
        end

        it "should save title" do
          announcement.title.should == "hello world"
        end

        it "should save content" do
          announcement.content.should == "can you see me?"
        end
      end
    end
  end
end
