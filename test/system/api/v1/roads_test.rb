require "application_system_test_case"

class Api::V1::RoadsTest < ApplicationSystemTestCase
  setup do
    @api_v1_road = api_v1_roads(:one)
  end

  test "visiting the index" do
    visit api_v1_roads_url
    assert_selector "h1", text: "Roads"
  end

  test "should create road" do
    visit api_v1_roads_url
    click_on "New road"

    click_on "Create Road"

    assert_text "Road was successfully created"
    click_on "Back"
  end

  test "should update Road" do
    visit api_v1_road_url(@api_v1_road)
    click_on "Edit this road", match: :first

    click_on "Update Road"

    assert_text "Road was successfully updated"
    click_on "Back"
  end

  test "should destroy Road" do
    visit api_v1_road_url(@api_v1_road)
    click_on "Destroy this road", match: :first

    assert_text "Road was successfully destroyed"
  end
end
