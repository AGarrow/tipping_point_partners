require "spec_helper"

describe UserMailer do

  
  describe "password_reset" do
    @dolittle = FactoryGirl.create(:company, :name => 'dolittle')
    let(:user) {FactoryGirl.create(:user, :email => 'dr_dolittle@dolittle.com')}

    let(:mail) { UserMailer.password_reset user }

#    it "renders the headers" do
#      mail.subject.should eq("Password reset")
#      mail.to.should eq(["to@example.org"])
#      mail.from.should eq(["from@example.com"])
#    end

#    it "renders the body" do
#      mail.body.encoded.should match("Hi")
#    end
  end

end
