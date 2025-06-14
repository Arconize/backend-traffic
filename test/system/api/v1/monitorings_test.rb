require "application_system_test_case"

class Api::V1::MonitoringsTest < ApplicationSystemTestCase
  setup do
    @api_v1_monitoring = api_v1_monitorings(:one)
  end

  test "visiting the index" do
    visit api_v1_monitorings_url
    assert_selector "h1", text: "Monitorings"
  end

  test "should create monitoring" do
    visit api_v1_monitorings_url
    click_on "New monitoring"

    click_on "Create Monitoring"

    assert_text "Monitoring was successfully created"
    click_on "Back"
  end

  test "should update Monitoring" do
    visit api_v1_monitoring_url(@api_v1_monitoring)
    click_on "Edit this monitoring", match: :first

    click_on "Update Monitoring"

    assert_text "Monitoring was successfully updated"
    click_on "Back"
  end

  test "should destroy Monitoring" do
    visit api_v1_monitoring_url(@api_v1_monitoring)
    click_on "Destroy this monitoring", match: :first

    assert_text "Monitoring was successfully destroyed"
  end
end
