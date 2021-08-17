require 'test_helper'

class Enterprise::RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get intex" do
    get enterprise_rooms_intex_url
    assert_response :success
  end

end
