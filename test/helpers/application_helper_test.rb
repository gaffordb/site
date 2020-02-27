require 'test_helper'
include ApplicationHelper

class ApplicationHelperTest < ActionDispatch::IntegrationTest
  test "get quote" do
    100.times {
      quote = ApplicationHelper.get_quote()
      assert_not_empty quote
      assert_not_equal(quote, "----\n")
    }
  end
end
