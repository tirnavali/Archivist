require "application_system_test_case"

class PhisycalStatusesTest < ApplicationSystemTestCase
  setup do
    @phisycal_status = phisycal_statuses(:first)

    visit new_user_session_path
    assert_selector "h2", text: "Log-in to your account"

    fill_in "Email", with: "tran.ce.co@gmail.com"
    fill_in "Password", with: "123456"
    click_on "Log in"
    assert_selector "h1", text: "Home page"
    
  end

  test "visiting the index" do
    visit phisycal_statuses_url
    assert_selector "h1", text: "Phisycal statuses"
  end

  test "should create phisycal status" do
    visit phisycal_statuses_url
    click_on "New phisycal status"

    fill_in "Name", with: @phisycal_status.name
    click_on "Create Phisycal status"

    assert_text "Phisycal status was successfully created"
    click_on "Back"
  end

  test "should update Phisycal status" do
    visit phisycal_status_url(@phisycal_status)
    click_on "Edit this phisycal status", match: :first

    fill_in "Name", with: @phisycal_status.name
    click_on "Update Phisycal status"

    assert_text "Phisycal status was successfully updated"
    click_on "Back"
  end

  test "should destroy Phisycal status" do
    visit phisycal_status_url(@phisycal_status)
    click_on "Destroy this phisycal status", match: :first

    assert_text "Phisycal status was successfully destroyed"
  end
end
