require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get account" do
    get user_account_url
    assert_response :success
  end

end
