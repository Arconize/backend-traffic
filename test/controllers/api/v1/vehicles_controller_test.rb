require "test_helper"

class Api::V1::VehiclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_vehicle = api_v1_vehicles(:one)
  end

  test "should get index" do
    get api_v1_vehicles_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_vehicle_url
    assert_response :success
  end

  test "should create api_v1_vehicle" do
    assert_difference("Api::V1::Vehicle.count") do
      post api_v1_vehicles_url, params: { api_v1_vehicle: {} }
    end

    assert_redirected_to api_v1_vehicle_url(Api::V1::Vehicle.last)
  end

  test "should show api_v1_vehicle" do
    get api_v1_vehicle_url(@api_v1_vehicle)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_vehicle_url(@api_v1_vehicle)
    assert_response :success
  end

  test "should update api_v1_vehicle" do
    patch api_v1_vehicle_url(@api_v1_vehicle), params: { api_v1_vehicle: {} }
    assert_redirected_to api_v1_vehicle_url(@api_v1_vehicle)
  end

  test "should destroy api_v1_vehicle" do
    assert_difference("Api::V1::Vehicle.count", -1) do
      delete api_v1_vehicle_url(@api_v1_vehicle)
    end

    assert_redirected_to api_v1_vehicles_url
  end
end
