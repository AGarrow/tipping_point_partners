require 'spec_helper'

describe "User pages" do

  subject { page }

  @shakeshack = FactoryGirl.create(:company, :name => "shakeshack")
#  let(:user) {FactoryGirl.create(:user, :email => 'danny_meyers@shakeshack.com')}

 
  describe "signup" do
   
    let(:submit) {"create"}

    before do 
      visit signup_path
      attach_file "picture", "/Users/alexio/Desktop/tipping_point_partners 12.12.57 PM/app/assets/images/rails.png"
    end

    describe "with invalid information" do
      it "should not create a user" do
        expect {click_button submit}.not_to change(User, :count)
      end
    
      describe "after submission" do
        before {click_button submit}

        it {response.should_not redirect_to home_path}
        it {should_not have_content('Password digest')}
      end
    end

    describe "with valid information" do
      before do
        fill_in "First name",             :with => 'pops'
        fill_in "Last name",              :with => 'werbizzow'
        fill_in "email",                  :with => 'pops@shakeshack.com'
        fill_in "Password",               :with => '1234567'
        fill_in "Password confirmation",  :with => '1234567'
      end

      it "should create a user" do
        expect {click_button submit}.to change(User, :count).by(1)

      end

      it "should redirect to home page" do
        click_button submit
        response.should redirect_to root_path
      end
    end
    
  end
end


