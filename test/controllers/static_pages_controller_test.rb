require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get source" do
    get static_pages_source_url
    assert_response :success
  end

end
