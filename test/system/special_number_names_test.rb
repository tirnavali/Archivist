require "application_system_test_case"

class SpecialNumberNamesTest < ApplicationSystemTestCase
  setup do
    @special_number_name = special_number_names(:one)
  end

  test "visiting the index" do
    visit special_number_names_url
    assert_selector "h1", text: "Special number names"
  end

  test "should create special number name" do
    visit special_number_names_url
    click_on "New special number name"

    fill_in "Name", with: @special_number_name.name
    click_on "Create Special number name"

    assert_text "Special number name was successfully created"
    click_on "Back"
  end

  test "should update Special number name" do
    visit special_number_name_url(@special_number_name)
    click_on "Edit this special number name", match: :first

    fill_in "Name", with: @special_number_name.name
    click_on "Update Special number name"

    assert_text "Special number name was successfully updated"
    click_on "Back"
  end

  test "should destroy Special number name" do
    visit special_number_name_url(@special_number_name)
    click_on "Destroy this special number name", match: :first

    assert_text "Special number name was successfully destroyed"
  end
end
