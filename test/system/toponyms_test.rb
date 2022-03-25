require "application_system_test_case"

class ToponymsTest < ApplicationSystemTestCase
  setup do
    @toponym = toponyms(:first)

    visit new_user_session_path
    assert_selector "h2", text: "Log-in to your account"

    fill_in "Email", with: "tran.ce.co@gmail.com"
    fill_in "Password", with: "123456"
    click_on "Log in"
    assert_selector "h1", text: "Home page"
  end

  test "visiting the index" do
    visit toponyms_url
    assert_selector "h1", text: "Toponyms"
  end

  test "should create toponym" do
    visit toponyms_url
    click_on "New toponym"

    fill_in "Name", with: @toponym.name
    click_on "Create Toponym"

    assert_text "Toponym was successfully created"
    click_on "Back"
  end

  test "should update Toponym" do
    visit toponym_url(@toponym)
    click_on "Edit this toponym", match: :first

    fill_in "Name", with: @toponym.name
    click_on "Update Toponym"

    assert_text "Toponym was successfully updated"
    click_on "Back"
  end

  test "should destroy Toponym" do
    visit toponym_url(@toponym)
    click_on "Destroy this toponym", match: :first

    assert_text "Toponym was successfully destroyed"
  end
end
