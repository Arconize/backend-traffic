require "test_helper"

class Api::V1::ZonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_zone = api_v1_zones(:one)
  end

  test "should get index" do
    get api_v1_zones_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_zone_url
    assert_response :success
  end

  test "should create api_v1_zone" do
    assert_difference("Api::V1::Zone.count") do
      post api_v1_zones_url, params: { api_v1_zone: {} }
    end

    assert_redirected_to api_v1_zone_url(Api::V1::Zone.last)
  end

  test "should show api_v1_zone" do
    get api_v1_zone_url(@api_v1_zone)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_zone_url(@api_v1_zone)
    assert_response :success
  end

  test "should update api_v1_zone" do
    patch api_v1_zone_url(@api_v1_zone), params: { api_v1_zone: {} }
    assert_redirected_to api_v1_zone_url(@api_v1_zone)
  end

  test "should destroy api_v1_zone" do
    assert_difference("Api::V1::Zone.count", -1) do
      delete api_v1_zone_url(@api_v1_zone)
    end

    assert_redirected_to api_v1_zones_url
  end
end
