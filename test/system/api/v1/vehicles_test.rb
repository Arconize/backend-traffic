require "application_system_test_case"

class Api::V1::VehiclesTest < ApplicationSystemTestCase
  setup do
    @api_v1_vehicle = api_v1_vehicles(:one)
  end

  test "visiting the index" do
    visit api_v1_vehicles_url
    assert_selector "h1", text: "Vehicles"
  end

  test "should create vehicle" do
    visit api_v1_vehicles_url
    click_on "New vehicle"

    click_on "Create Vehicle"

    assert_text "Vehicle was successfully created"
    click_on "Back"
  end

  test "should update Vehicle" do
    visit api_v1_vehicle_url(@api_v1_vehicle)
    click_on "Edit this vehicle", match: :first

    click_on "Update Vehicle"

    assert_text "Vehicle was successfully updated"
    click_on "Back"
  end

  test "should destroy Vehicle" do
    visit api_v1_vehicle_url(@api_v1_vehicle)
    click_on "Destroy this vehicle", match: :first

    assert_text "Vehicle was successfully destroyed"
  end
end
