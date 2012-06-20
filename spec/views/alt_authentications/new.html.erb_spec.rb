require 'spec_helper'

describe "alt_authentications/new" do
  before(:each) do
    assign(:alt_authentication, stub_model(AltAuthentication,
      :user_id => 1,
      :provider => "MyString",
      :uid => "MyString"
    ).as_new_record)
  end

  it "renders new alt_authentication form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => alt_authentications_path, :method => "post" do
      assert_select "input#alt_authentication_user_id", :name => "alt_authentication[user_id]"
      assert_select "input#alt_authentication_provider", :name => "alt_authentication[provider]"
      assert_select "input#alt_authentication_uid", :name => "alt_authentication[uid]"
    end
  end
end
