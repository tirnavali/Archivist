require "application_system_test_case"

class FondsTest < ApplicationSystemTestCase
  setup do
    login_as users(:admin)
    @fond = fonds(:first)
  end

  test "visiting the index" do
    visit fonds_url
    assert_selector "h1", text: "Fonds"
  end

  test "should create fond" do
    visit fonds_url
    click_on "New fond"

    fill_in "Fond", with: @fond.Fond_id
    fill_in "Name", with: @fond.name
    click_on "Create Fond"

    assert_text "Fond was successfully created"
    click_on "Back"
  end

  test "should update Fond" do
    visit fond_url(@fond)
    click_on "Edit this fond", match: :first

    fill_in "Fond", with: @fond.Fond_id
    fill_in "Name", with: @fond.name
    click_on "Update Fond"

    assert_text "Fond was successfully updated"
    click_on "Back"
  end

  test "should destroy Fond" do
    visit fond_url(@fond)
    click_on "Destroy this fond", match: :first

    assert_text "Fond was successfully destroyed"
  end
end
