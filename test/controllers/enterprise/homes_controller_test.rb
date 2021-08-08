require 'test_helper'

class Enterprise::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get enterprise_homes_top_url
    assert_response :success
  end

  test "should get about" do
    get enterprise_homes_about_url
    assert_response :success
  end

end
