require 'test_helper'

class User::EnterprisesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_enterprises_show_url
    assert_response :success
  end

end
