require 'test_helper'

class Api::V1::AttendancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_attendances_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_attendances_create_url
    assert_response :success
  end

end
