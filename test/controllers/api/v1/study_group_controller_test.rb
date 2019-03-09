require 'test_helper'

class Api::V1::StudyGroupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_study_group_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_study_group_create_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_study_group_destroy_url
    assert_response :success
  end

end
