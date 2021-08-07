require 'test_helper'

class User::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_users_update_url
    assert_response :success
  end

  test "should get skill_sheet_edit" do
    get user_users_skill_sheet_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_users_update_url
    assert_response :success
  end

  test "should get skill_sheet_update" do
    get user_users_skill_sheet_update_url
    assert_response :success
  end

  test "should get desired_condition_edit" do
    get user_users_desired_condition_edit_url
    assert_response :success
  end

  test "should get desired_condition_update" do
    get user_users_desired_condition_update_url
    assert_response :success
  end

  test "should get self_pr_edit" do
    get user_users_self_pr_edit_url
    assert_response :success
  end

  test "should get self_pr_update" do
    get user_users_self_pr_update_url
    assert_response :success
  end

end
