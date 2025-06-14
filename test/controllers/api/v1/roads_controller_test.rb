require "test_helper"

class Api::V1::RoadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_road = api_v1_roads(:one)
  end

  test "should get index" do
    get api_v1_roads_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_road_url
    assert_response :success
  end

  test "should create api_v1_road" do
    assert_difference("Api::V1::Road.count") do
      post api_v1_roads_url, params: { api_v1_road: {} }
    end

    assert_redirected_to api_v1_road_url(Api::V1::Road.last)
  end

  test "should show api_v1_road" do
    get api_v1_road_url(@api_v1_road)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_road_url(@api_v1_road)
    assert_response :success
  end

  test "should update api_v1_road" do
    patch api_v1_road_url(@api_v1_road), params: { api_v1_road: {} }
    assert_redirected_to api_v1_road_url(@api_v1_road)
  end

  test "should destroy api_v1_road" do
    assert_difference("Api::V1::Road.count", -1) do
      delete api_v1_road_url(@api_v1_road)
    end

    assert_redirected_to api_v1_roads_url
  end
end
