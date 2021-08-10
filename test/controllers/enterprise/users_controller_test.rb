require 'test_helper'

class Enterprise::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get enterprise_users_show_url
    assert_response :success
  end

  test "should get index" do
    get enterprise_users_index_url
    assert_response :success
  end

end
