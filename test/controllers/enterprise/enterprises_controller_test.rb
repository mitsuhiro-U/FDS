require 'test_helper'

class Enterprise::EnterprisesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get enterprise_enterprises_edit_url
    assert_response :success
  end

  test "should get update" do
    get enterprise_enterprises_update_url
    assert_response :success
  end

  test "should get business_content" do
    get enterprise_enterprises_business_content_url
    assert_response :success
  end

  test "should get business_content_update" do
    get enterprise_enterprises_business_content_update_url
    assert_response :success
  end

end
