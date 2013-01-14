require 'spec_helper'

describe "User pages" do

  subject { page }

  @shakeshack = FactoryGirl.create(:company, :name => "shakeshack")
  FactoryGirl.create(:user, :email => 'danny_meyers@shakeshack.com')

  describe "signup" do
   
    let(:submit) {"Create"}

    before :each do 
      visit signup_path
      attach_file "user_avatar", "/Users/alexio/Desktop/tipping_point_partners 12.12.57 PM/app/assets/images/rails.png"
    end

    describe "with invalid information" do
      it "should not create a user" do
        expect {click_button submit}.not_to change(User, :count)
      end
    
      describe "after submission" do
        before {click_button submit}

        it {current_path.should == '/users'}
        it {should have_content('New User')}
      end
    end

    describe "with valid information" do
      before do
        fill_in 'user_first_name',             :with => 'pops'
        fill_in 'user_last_name',              :with => 'werbizzow'
        fill_in 'user_email',                  :with => "dood@shakeshack.com"
        fill_in 'user_password',               :with => "1234567"
        fill_in 'user_password_confirmation',  :with => "1234567"
      end

      it "should create a user" do
        expect {
          click_button submit
          }.to change(User, :count).by(1)
      end

      it "should redirect to home page" do
        click_button submit
        page.should have_content "Welcome Pops!"
      end

      describe "before activation" do
        before do
          click_button submit
        end
        it "should display an activate account message" do
          visit home_path
          page.should have_content 'Activate Account'
        end
        it "should restrict user to home page" do
          visit workspace_path
          current_path.should == home_path
          visit companies_path
          current_path.should == home_path
        end
      end
      describe "after validation" do
        before do
          @user = User.find_by_email('danny_meyers@shakeshack.com')
          visit validate_url(:token => @user.validation_token)
        end
        it "should no longer display activation message" do
          visit home_path
          page.should_not have_content "Activate Account"
        end
        it "should not restrict access to pages" do
          visit workspace_path
          current_path.should == workspace_path
          visit companies_path
          current_path.should == companies_path
        end
      end


    end
    
  end
  describe "sign in" do
    before do
      visit signin_path
    end
    describe "with invalid information" do
      it "should reject empty fields" do
        fill_in "session_email",   :with => ''
        fill_in "session_password",   :with => ''
        click_button "Sign in"
        current_path.should == '/sessions'
      end
      it "should reject bad password/username combo" do
        fill_in "session_email",      :with => 'notReal@dips.com'
        fill_in "session_password",   :with => 'what?'
        click_button "Sign in"
        current_path.should == '/sessions'
        page.should have_content 'Sign in'
      end
      it "should restrict access to pages" do
        visit companies_path
        current_path.should == signin_path
      end
      it "should display user errors" do
        page.should have_content ''
      end

    end
    describe "with valid information" do
      before :each do 
        @user = User.find_by_email('danny_meyers@shakeshack.com')
        visit validate_url(:token => @user.validation_token)
        visit signin_path
        fill_in "session_email",    :with => "danny_meyers@shakeshack.com"
        fill_in "session_password", :with => "foobar"
        click_button "Sign in"

      end
      it "user should be signed in" do
        page.should have_content "Welcome Danny!"
      end 
      it "should redirect to home page" do
        current_path.should == root_path
      end
      it "should not restrict access to pages" do
        visit workspace_path
        current_path.should == workspace_path
        visit companies_path
        current_path.should == companies_path
      end
    end
  end

end


