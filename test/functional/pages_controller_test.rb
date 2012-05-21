require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get work" do
    get :work
    assert_response :success
  end

  test "should get people" do
    get :people
    assert_response :success
  end

  test "should get workspace" do
    get :workspace
    assert_response :success
  end

  test "should get faqs" do
    get :faqs
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
