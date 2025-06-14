require "application_system_test_case"

class Api::V1::CamerasTest < ApplicationSystemTestCase
  setup do
    @api_v1_camera = api_v1_cameras(:one)
  end

  test "visiting the index" do
    visit api_v1_cameras_url
    assert_selector "h1", text: "Cameras"
  end

  test "should create camera" do
    visit api_v1_cameras_url
    click_on "New camera"

    click_on "Create Camera"

    assert_text "Camera was successfully created"
    click_on "Back"
  end

  test "should update Camera" do
    visit api_v1_camera_url(@api_v1_camera)
    click_on "Edit this camera", match: :first

    click_on "Update Camera"

    assert_text "Camera was successfully updated"
    click_on "Back"
  end

  test "should destroy Camera" do
    visit api_v1_camera_url(@api_v1_camera)
    click_on "Destroy this camera", match: :first

    assert_text "Camera was successfully destroyed"
  end
end
