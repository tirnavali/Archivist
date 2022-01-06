require "application_system_test_case"

class PrivaciesTest < ApplicationSystemTestCase
  setup do
    @privacy = privacies(:one)
  end

  test "visiting the index" do
    visit privacies_url
    assert_selector "h1", text: "Privacies"
  end

  test "should create privacy" do
    visit privacies_url
    click_on "New privacy"

    fill_in "Name", with: @privacy.name
    click_on "Create Privacy"

    assert_text "Privacy was successfully created"
    click_on "Back"
  end

  test "should update Privacy" do
    visit privacy_url(@privacy)
    click_on "Edit this privacy", match: :first

    fill_in "Name", with: @privacy.name
    click_on "Update Privacy"

    assert_text "Privacy was successfully updated"
    click_on "Back"
  end

  test "should destroy Privacy" do
    visit privacy_url(@privacy)
    click_on "Destroy this privacy", match: :first

    assert_text "Privacy was successfully destroyed"
  end
end
