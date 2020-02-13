require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "Home | Internet website"
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "About | Internet website"

  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "Help | Internet website"

  end

end
