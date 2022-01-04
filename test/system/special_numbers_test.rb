require "application_system_test_case"

class SpecialNumbersTest < ApplicationSystemTestCase
  setup do
    @special_number = special_numbers(:one)
  end

  test "visiting the index" do
    visit special_numbers_url
    assert_selector "h1", text: "Special numbers"
  end

  test "should create special number" do
    visit special_numbers_url
    click_on "New special number"

    fill_in "Number", with: @special_number.number
    fill_in "Special number name", with: @special_number.special_number_name_id
    click_on "Create Special number"

    assert_text "Special number was successfully created"
    click_on "Back"
  end

  test "should update Special number" do
    visit special_number_url(@special_number)
    click_on "Edit this special number", match: :first

    fill_in "Number", with: @special_number.number
    fill_in "Special number name", with: @special_number.special_number_name_id
    click_on "Update Special number"

    assert_text "Special number was successfully updated"
    click_on "Back"
  end

  test "should destroy Special number" do
    visit special_number_url(@special_number)
    click_on "Destroy this special number", match: :first

    assert_text "Special number was successfully destroyed"
  end
end
