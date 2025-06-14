require "test_helper"

class Api::V1::CamerasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_camera = api_v1_cameras(:one)
  end

  test "should get index" do
    get api_v1_cameras_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_camera_url
    assert_response :success
  end

  test "should create api_v1_camera" do
    assert_difference("Api::V1::Camera.count") do
      post api_v1_cameras_url, params: { api_v1_camera: {} }
    end

    assert_redirected_to api_v1_camera_url(Api::V1::Camera.last)
  end

  test "should show api_v1_camera" do
    get api_v1_camera_url(@api_v1_camera)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_camera_url(@api_v1_camera)
    assert_response :success
  end

  test "should update api_v1_camera" do
    patch api_v1_camera_url(@api_v1_camera), params: { api_v1_camera: {} }
    assert_redirected_to api_v1_camera_url(@api_v1_camera)
  end

  test "should destroy api_v1_camera" do
    assert_difference("Api::V1::Camera.count", -1) do
      delete api_v1_camera_url(@api_v1_camera)
    end

    assert_redirected_to api_v1_cameras_url
  end
end
