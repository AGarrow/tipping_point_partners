require 'spec_helper'

describe "Users" do

  subject { page }
 
  describe "signup page" do 
    before {visit signup_path}
    
    it { should have_selector ('h1') }
    it { should have_selector ('title')}
  end
  
  describe "profile page" do 
    before {visit user_path(user)}
    
    it { should have_selector('h1',    :content => user.name)}
    it { should have_selector('title', :content => user.name)}
end
end
