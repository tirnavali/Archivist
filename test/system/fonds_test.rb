require "application_system_test_case"

class FondsTest < ApplicationSystemTestCase
  setup do
    @fond = fonds(:first)

    visit new_user_session_path
    assert_selector "h2", text: "Log-in to your account"

    fill_in "Email", with: "tran.ce.co@gmail.com"
    fill_in "Password", with: "123456"
    click_on "Log in"
    assert_selector "h1", text: "Home page"
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
