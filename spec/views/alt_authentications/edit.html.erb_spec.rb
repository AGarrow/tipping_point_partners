require 'spec_helper'

describe "alt_authentications/edit" do
  before(:each) do
    @alt_authentication = assign(:alt_authentication, stub_model(AltAuthentication,
      :user_id => 1,
      :provider => "MyString",
      :uid => "MyString"
    ))
  end

  it "renders the edit alt_authentication form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => alt_authentications_path(@alt_authentication), :method => "post" do
      assert_select "input#alt_authentication_user_id", :name => "alt_authentication[user_id]"
      assert_select "input#alt_authentication_provider", :name => "alt_authentication[provider]"
      assert_select "input#alt_authentication_uid", :name => "alt_authentication[uid]"
    end
  end
end
