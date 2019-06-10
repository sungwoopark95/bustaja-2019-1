require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_url
    assert_response :success
  end

  test "should get timeslotize" do
    get users_timeslotize_url
    assert_response :success
  end

end
