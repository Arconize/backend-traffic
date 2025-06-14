require "application_system_test_case"

class Api::V1::ZoneTypesTest < ApplicationSystemTestCase
  setup do
    @api_v1_zone_type = api_v1_zone_types(:one)
  end

  test "visiting the index" do
    visit api_v1_zone_types_url
    assert_selector "h1", text: "Zone types"
  end

  test "should create zone type" do
    visit api_v1_zone_types_url
    click_on "New zone type"

    click_on "Create Zone type"

    assert_text "Zone type was successfully created"
    click_on "Back"
  end

  test "should update Zone type" do
    visit api_v1_zone_type_url(@api_v1_zone_type)
    click_on "Edit this zone type", match: :first

    click_on "Update Zone type"

    assert_text "Zone type was successfully updated"
    click_on "Back"
  end

  test "should destroy Zone type" do
    visit api_v1_zone_type_url(@api_v1_zone_type)
    click_on "Destroy this zone type", match: :first

    assert_text "Zone type was successfully destroyed"
  end
end
