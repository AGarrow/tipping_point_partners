require 'spec_helper'

describe "alt_authentications/index" do
  before(:each) do
    assign(:alt_authentications, [
      stub_model(AltAuthentication,
        :user_id => 1,
        :provider => "Provider",
        :uid => "Uid"
      ),
      stub_model(AltAuthentication,
        :user_id => 1,
        :provider => "Provider",
        :uid => "Uid"
      )
    ])
  end

  it "renders a list of alt_authentications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Provider".to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
  end
end
