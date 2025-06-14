require "test_helper"

class Api::V1::MonitoringsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_monitoring = api_v1_monitorings(:one)
  end

  test "should get index" do
    get api_v1_monitorings_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_monitoring_url
    assert_response :success
  end

  test "should create api_v1_monitoring" do
    assert_difference("Api::V1::Monitoring.count") do
      post api_v1_monitorings_url, params: { api_v1_monitoring: {} }
    end

    assert_redirected_to api_v1_monitoring_url(Api::V1::Monitoring.last)
  end

  test "should show api_v1_monitoring" do
    get api_v1_monitoring_url(@api_v1_monitoring)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_monitoring_url(@api_v1_monitoring)
    assert_response :success
  end

  test "should update api_v1_monitoring" do
    patch api_v1_monitoring_url(@api_v1_monitoring), params: { api_v1_monitoring: {} }
    assert_redirected_to api_v1_monitoring_url(@api_v1_monitoring)
  end

  test "should destroy api_v1_monitoring" do
    assert_difference("Api::V1::Monitoring.count", -1) do
      delete api_v1_monitoring_url(@api_v1_monitoring)
    end

    assert_redirected_to api_v1_monitorings_url
  end
end
