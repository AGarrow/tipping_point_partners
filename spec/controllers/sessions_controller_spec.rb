require 'spec_helper'
include SessionsHelper
describe SessionsController do

@lonely = FactoryGirl.create(:company, :name => 'lonely')
let(:user) {FactoryGirl.create(:user, :email => 'fred_astaire@lonely.com')}


  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

end
