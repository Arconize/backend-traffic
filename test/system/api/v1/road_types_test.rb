require "application_system_test_case"

class Api::V1::RoadTypesTest < ApplicationSystemTestCase
  setup do
    @api_v1_road_type = api_v1_road_types(:one)
  end

  test "visiting the index" do
    visit api_v1_road_types_url
    assert_selector "h1", text: "Road types"
  end

  test "should create road type" do
    visit api_v1_road_types_url
    click_on "New road type"

    click_on "Create Road type"

    assert_text "Road type was successfully created"
    click_on "Back"
  end

  test "should update Road type" do
    visit api_v1_road_type_url(@api_v1_road_type)
    click_on "Edit this road type", match: :first

    click_on "Update Road type"

    assert_text "Road type was successfully updated"
    click_on "Back"
  end

  test "should destroy Road type" do
    visit api_v1_road_type_url(@api_v1_road_type)
    click_on "Destroy this road type", match: :first

    assert_text "Road type was successfully destroyed"
  end
end
