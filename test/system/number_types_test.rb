require "application_system_test_case"

class NumberTypesTest < ApplicationSystemTestCase
  setup do
    login_as users(:admin)
    @number_type = number_types(:first)
  end

  test "visiting the index" do
    visit number_types_url
    assert_selector "h1", text: "Number types"
  end

  test "should create number type" do
    visit number_types_url
    click_on "New number type"

    fill_in "Name", with: @number_type.name
    click_on "Create Number type"

    assert_text "Number type was successfully created"
    click_on "Back"
  end

  test "should update Number type" do
    visit number_type_url(@number_type)
    click_on "Edit this number type", match: :first

    fill_in "Name", with: @number_type.name
    click_on "Update Number type"

    assert_text "Number type was successfully updated"
    click_on "Back"
  end

  test "should destroy Number type" do
    visit number_type_url(@number_type)
    click_on "Destroy this number type", match: :first

    assert_text "Number type was successfully destroyed"
  end
end
