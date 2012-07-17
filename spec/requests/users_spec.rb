require 'spec_helper'

describe "Users" do

  subject { page }
 
  describe "signup page" do 
    before {visit signup_path}
    
    it { should have_selector ('h1',    text: 'New User') }
    it { should have_selector ('title', text: 'New User')}
  end
  
  describe "profile page" do 
    before {visit user_path(user)}
    
    it { should have_selector('h1',    text: user.name)}
    it { should have_selector('title', text: user.name)}
end
